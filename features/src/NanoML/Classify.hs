{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE MultiWayIf #-}
module NanoML.Classify where

import Control.Applicative
import Control.Monad
import Control.Monad.Except
import Control.Monad.State
import Data.Bifunctor
import Data.Data
import Data.Generics.Aliases (mkM)
import Data.Generics.Schemes
import Data.Hashable
import qualified Data.Map.Strict as Map
import Data.Map.Strict (Map)
import Data.Maybe
import Data.Monoid hiding (Alt)
import qualified Data.Set as Set
import Data.Set (Set)
import GHC.Generics

import NanoML.Parser
import NanoML.Types

import Debug.Trace

preds_has :: [Expr -> Double]
preds_has = [has_op o | o <- [Eq .. Mod]]
     ++ [has_con "::", has_con "[]", has_con "(,)", has_fun]

preds_count :: [Expr -> Double]
preds_count = [count_op o | o <- [Eq .. Mod]]
     ++ [count_con "::", count_con "[]", count_con "(,)", count_fun]

preds_thas :: [TExpr -> Double]
preds_thas = [thas_op o | o <- [Eq .. Mod]]
     ++ [thas_con "::", thas_con "[]", thas_con "(,)", thas_fun]

preds_tcon :: [TExpr -> Double]
preds_tcon = [is_tcon tc | tc <- [tINT, tFLOAT, tCHAR, tSTRING, tBOOL, tLIST, tUNIT, "Tuple", "Fun", "expr"]]

preds_tcon_agg :: [TExpr -> Double]
preds_tcon_agg = [has_tcon tc | tc <- [tINT, tFLOAT, tCHAR, tSTRING, tBOOL, tLIST, tUNIT, "Tuple", "Fun", "expr"]]

preds_tcon_count :: [TExpr -> Double]
preds_tcon_count = [count_tcon tc | tc <- [tINT, tFLOAT, tCHAR, tSTRING, tBOOL, tLIST, tUNIT, "Tuple", "Fun", "expr"]]

fold :: Monoid a => (Expr -> a -> a) -> a -> Expr -> a
fold f z = go
  where
  go e = f e $ case e of
    Var {} -> z
    Lam _ _ b _ -> go b
    App _ f es -> mconcat $ map go (f:es)
    Bop _ _ e1 e2 -> mappend (go e1) (go e2)
    Uop _ _ e -> go e
    Lit {} -> z
    Let _ _ pes e -> mconcat (map (go.snd) pes ++ [go e])
    Ite _ x y z -> go x <> go y <> go z
    Seq _ e1 e2 -> mappend (go e1) (go e2)
    Case _ e as -> mconcat (go e : map (go.thd3) as)
    Tuple _ es -> mconcat (map go es)
    ConApp _ _ me _ -> maybe mempty go me
    Record _ fes _ -> mconcat (map (go.snd) fes)
    Field _ e _ -> go e
    SetField _ e1 _ e2 -> mappend (go e1) (go e2)
    List _ es _ -> mconcat (map go es)
    Array _ es _ -> mconcat (map go es)
    Try _ e as -> mconcat (go e : map (go.thd3) as)
    -- the rest of these should not appear in parsed exprs
    Prim1 {} -> z
    Prim2 {} -> z
    With {} -> z
    Replace {} -> z
    Hole {} -> z
    Ref {} -> z

foldM :: (Monad m, Monoid a) => (Expr -> a -> m a) -> a -> Expr -> m a
foldM f z = go
  where
  go e = f e =<< case e of
    Var {} -> return z
    Lam _ _ b _ -> go b
    App _ f es -> mconcat <$> mapM go (f:es)
    Bop _ _ e1 e2 -> mappend <$> (go e1) <*> (go e2)
    Uop _ _ e -> go e
    Lit {} -> return z
    Let _ _ pes e -> mconcat <$> (mapM go (map snd pes ++ [e]))
    Ite _ x y z -> mconcat <$> sequence [go x, go y, go z]
    Seq _ e1 e2 -> mappend <$> (go e1) <*> (go e2)
    Case _ e as -> mconcat <$> (mapM go (e : map thd3 as))
    Tuple _ es -> mconcat <$> (mapM go es)
    ConApp _ _ me _ -> maybe (return mempty) go me
    Record _ fes _ -> mconcat <$> (mapM (go.snd) fes)
    Field _ e _ -> go e
    SetField _ e1 _ e2 -> mappend <$> (go e1) <*> (go e2)
    List _ es _ -> mconcat <$> (mapM go es)
    Array _ es _ -> mconcat <$> (mapM go es)
    Try _ e as -> mconcat <$> (mapM go (e : map thd3 as))
    -- the rest of these should not appear in parsed exprs
    Prim1 {} -> return z
    Prim2 {} -> return z
    With {} -> return z
    Replace {} -> return z
    Hole {} -> return z
    Ref {} -> return z

-- TODO: rejigger to
-- classify :: [Expr -> Bool] -> Expr -> Map SrcLoc [Bool]
-- so we can iterate fast on different feature vectors
-- produce simple output for ML folks to consume,
-- ideally something like
-- type Check = Bool
-- type Feature = Bool (Float?)
-- [(Check, [Feature])]

classify :: [Expr -> Double] -> Expr -> [(SrcSpan, [Double])]
classify ps = fold f []
  where
  f e acc = (getLoc e, map ($e) ps) : acc
  getLoc e = fromJust (getSrcSpanExprMaybe e)

tclassify :: [TExpr -> Double] -> TExpr -> [(SrcSpan, [Double])]
tclassify ps = tfold f []
  where
  f e acc = (getLoc e, map ($e) ps) : acc
  getLoc = infoSpan . texprInfo

bool2double :: Bool -> Double
bool2double b = if b then 1 else 0

count_op :: Bop -> Expr -> Double
count_op b = getSum . fold f mempty
  where
  f e acc = acc <> case e of
                     Bop _ b' _ _ -> Sum . bool2double $  b == b'
                     _            -> mempty

count_con :: DCon -> Expr -> Double
count_con c = getSum . fold f mempty
  where
  f e acc = acc <> case e of
                     ConApp _ c' _ _ -> Sum . bool2double $ c == c'
                                       -- FIXME
                     Case _ _ as -> Sum . bool2double $ any (pat_has_con c) (map fst3 as)
                     Tuple _ _ -> Sum . bool2double $ c == "(,)"
                     List _ _ _ -> Sum . bool2double $ c == "::" || c == "[]"
                     _ -> mempty

count_fun :: Expr -> Double
count_fun = getSum . fold f mempty
  where
  f e acc = acc <> case e of
                     Lam {} -> Sum 1
                     App {} -> Sum 1
                     _ -> mempty

has_op :: Bop -> Expr -> Double
has_op b = bool2double . getAny . fold f mempty
  where
  f e acc = acc <> case e of
                     Bop _ b' _ _ -> Any $ b == b'
                     _            -> mempty

has_con :: DCon -> Expr -> Double
has_con c = bool2double . getAny . fold f mempty
  where
  f e acc = acc <> case e of
                     ConApp _ c' _ _ -> Any $ c == c'
                     Case _ _ as -> Any $ any (pat_has_con c) (map fst3 as)
                     Tuple _ _ -> Any $ c == "(,)"
                     List _ _ _ -> Any $ c == "::" || c == "[]"
                     _ -> mempty

has_fun :: Expr -> Double
has_fun = bool2double . getAny . fold f mempty
  where
  f e acc = acc <> case e of
                     Lam {} -> Any True
                     App {} -> Any True
                     _ -> mempty

thas_op :: Bop -> TExpr -> Double
thas_op b = bool2double . getAny . tfold f mempty
  where
  f e acc = acc <> case e of
                     T_Bop _ b' _ _ -> Any $ b == b'
                     _            -> mempty

thas_con :: DCon -> TExpr -> Double
thas_con c = bool2double . getAny . tfold f mempty
  where
  f e acc = acc <> case e of
                     T_ConApp _ c' _ -> Any $ c == c'
                     T_Case _ _ as -> Any $ any (pat_has_con c) (map fst3 as)
                     T_Tuple _ _ -> Any $ c == "(,)"
                     T_List _ _ -> Any $ c == "::" || c == "[]"
                     _ -> mempty

thas_fun :: TExpr -> Double
thas_fun = bool2double . getAny . tfold f mempty
  where
  f e acc = acc <> case e of
                     T_Lam {} -> Any True
                     T_App {} -> Any True
                     _ -> mempty

pat_has_con :: DCon -> Pat -> Bool
pat_has_con c p' = case p' of
  ConPat _ c' mp -> c == c' || maybe False (pat_has_con c) mp
  ConsPat _ p1 p2 -> c == "::" || pat_has_con c p1 || pat_has_con c p2
  ListPat _ ps -> any (pat_has_con c) ps
  TuplePat _ ps -> c == "(,)" || any (pat_has_con c) ps
  OrPat _ p1 p2 -> pat_has_con c p1 || pat_has_con c p2
  AsPat _ p _ -> pat_has_con c p
  ConstraintPat _ p _ -> pat_has_con c p
  _ -> False




diff :: Expr -> Expr -> Set SrcSpan
diff e1 e2 = case (e1, e2) of
  (Var lx x, Var ly y)
    | x == y
      -> mempty
  (Lam lx px x _, Lam ly py y _)
    | px == py
      -> diff x y
  (App lx fx ax, App ly fy ay)
    | length ax == length ay
      -> merge $ (diff fx fy) : (zipWith diff ax ay)
  (Bop lx bx x1 x2, Bop ly by y1 y2)
    | bx == by
      -> merge [diff x1 y1, diff x2 y2]
  (Uop lx ux x, Uop ly uy y)
    | ux == uy
      -> diff x y
  (Lit lx x, Lit ly y)
    | x == y
      -> mempty
  (Let lx rx xbs x, Let ly ry ybs y)
    | rx == ry && length xbs == length ybs && map fst xbs == map fst ybs
      -> merge $ diff x y : zipWith diff (map snd xbs) (map snd ybs)
  (Ite lx bx tx fx, Ite ly by ty fy)
      -> merge $ [diff bx by, diff tx ty, diff fx fy]
  (Seq lx x1 x2, Seq ly y1 y2)
      -> merge $ [diff x1 y1, diff x2 y2]
  (Case lx x axs, Case ly y ays)
    | length axs == length ays && map fst3 axs == map fst3 ays && map snd3 axs == map snd3 ays
      -> merge $ diff x y : zipWith diff (map thd3 axs) (map thd3 ays)
  (Tuple lx xs, Tuple ly ys)
    | length xs == length ys
      -> merge (zipWith diff xs ys)
  (List lx xs _, List ly ys _)
    | length xs == length ys
      -> merge (zipWith diff xs ys)
  (Array lx xs _, Array ly ys _)
    | length xs == length ys
      -> merge (zipWith diff xs ys)
  (ConApp lx cx mx mtx, ConApp ly cy my mty)
    | cx == cy -> if
        | Just x <- mx, Just y <- my
          -> diff x y
        | Nothing <- mx, Nothing <- my
          -> mempty
        | otherwise
          -> Set.singleton (fromJust lx)
  (Record lx fxs mtx, Record ly fys mty)
    | map fst fxs == map fst fys
      -> merge (zipWith diff (map snd fxs) (map snd fys))
  (Prim1 lx (P1 vx _ _), Prim1 ly (P1 vy _ _))
    | vx == vy
      -> mempty
  (Prim2 lx (P2 vx _ _ _), Prim2 ly (P2 vy _ _ _))
    | vx == vy
      -> mempty
  -- (Val _ x, Val _ y)
  --   | x == y
  --     -> Nothing
  -- (With lx ex x, With ly ey y)
  --   | lx == ly && envId ex == envId ey
  --     -> diff x y
  -- (Replace lx ex x, Replace ly ey y)
  --   | lx == ly && envId ex == envId ey
  --     -> diff x y
  -- (_, Replace _ _ _)
  --   -> Just (e1, e2)
  -- (Replace _ env' _, _)
  --   -> Just (e1, e2)
  _ -> Set.singleton $ fromJust $ getSrcSpanExprMaybe e1

  where
  merge = mconcat
  -- merge ls = case catMaybes ls of
  --   -- no diff in subexprs => no diff
  --   []  -> Nothing
  --   -- diff in *one* subexpr => that expr
  --   [x] -> Just x
  --   -- diff in *multiple* subexprs => parent expr
  --   _   -> getSrcSpanExprMaybe e1

-- | Diff two programs by declaration group, and return a set of
-- spans that have changed in the first program.
diffProg :: Prog -> Prog -> Set SrcSpan
diffProg p1 p2 = mconcat $ map go p1
  where
  go (DFun _ _ pes) = mconcat $ map to pes
  go _              = mempty

  to (VarPat _ v, e1)
    | Just e2 <- lookup v p2ves
    = diff e1 e2
  to _
    = mempty

  p2ves = [(v,e) | DFun _ _ pes <- p2, (VarPat _ v, e) <- pes]

  -- merge ls = case catMaybes ls of
  --   -- no diff in subexprs => no diff
  --   []  -> Nothing
  --   -- diff in *one* subexpr => that expr
  --   [x] -> Just x
  --   -- diff in *multiple* subexprs => parent expr
  --   _   -> Just $ joinSrcSpan (getSrcSpan (head p1)) (getSrcSpan (last p1))

diffDecl :: Decl -> Decl -> Set SrcSpan
diffDecl d1 d2 = case (d1, d2) of
  (DFun _ r1 pes1, DFun _ r2 pes2)
    | r1 == r2 && map fst pes1 == map fst pes2
    -> mconcat $ zipWith (\(_,e1) (_,e2) -> diff e1 e2) pes1 pes2
  (DEvl _ e1, DEvl _ e2)
    -> diff e1 e2
  _ -> mempty
  where
  -- merge ls = case catMaybes ls of
  --   -- no diff in subexprs => no diff
  --   []  -> Nothing
  --   -- diff in *one* subexpr => that expr
  --   [x] -> Just x
  --   -- diff in *multiple* subexprs => parent expr
  --   _   -> Just $ getSrcSpan d1

type TProg = [TDecl]

data TDecl
  = TDFun SrcSpan RecFlag [(Pat,TExpr)]
  | TDEvl SrcSpan TExpr
  | TDTyp SrcSpan [TypeDecl]
  | TDExn SrcSpan DataDecl
  deriving (Show, Eq, Data, Generic)
instance Hashable TDecl

typeProg :: MonadEval m => Prog -> m TProg
typeProg p = do
  tp <- mapM typeDecl p
  forM tp $ \ td -> case td of
    TDFun {} -> everywhereM (mkM substM) td
    TDEvl {} -> everywhereM (mkM substM) td
    -- don't look at TDTyp or TDExn, they contain bottoms
    _ -> return td

typeDecl :: MonadEval m => Decl -> m TDecl
typeDecl = \case
  DFun s r pes -> do
    -- NOTE: don't forget to generalize
    (bnds, ptes) <- case r of
      Rec -> typeRecBinds pes
      NonRec -> first concat . unzip <$> mapM typeBind pes
    modify' $ \ s -> s { stVarTypes = foldr (uncurry Map.insert) (stVarTypes s) bnds }
    return (TDFun s r ptes)
  DEvl s e -> do
    te <- typeExpr e
    return (TDEvl s te)
  DTyp s tds -> do
    mapM_ addType tds
    return (TDTyp s tds)
  DExn s d -> error "typeDecl: impossible"


data Info = MkInfo
  { infoSpan :: SrcSpan
  , infoType :: Type
  } deriving (Show, Data, Generic, Eq)
instance Hashable Info

mkInfo :: MSrcSpan -> Type -> Info
mkInfo ml t = MkInfo (fromJust ml) t

data TExpr
  = T_Var !Info !Var
  | T_Lam !Info !Pat !TExpr
  | T_App !Info !TExpr [TExpr]
  | T_Bop !Info !Bop !TExpr !TExpr
  | T_Uop !Info !Uop !TExpr
  | T_Lit !Info !Literal
  | T_Let !Info !RecFlag [(Pat,TExpr)] !TExpr
  | T_Ite !Info !TExpr !TExpr !TExpr
  | T_Seq !Info !TExpr !TExpr
  | T_Case !Info !TExpr [TAlt]
  | T_Tuple !Info [TExpr]
  | T_ConApp !Info !DCon (Maybe TExpr)
  | T_Record !Info [(String, TExpr)]
  | T_Field !Info !TExpr !String
  | T_SetField !Info !TExpr !String !TExpr
  | T_Array !Info [TExpr]
  | T_List !Info [TExpr]
  | T_Try !Info !TExpr [TAlt]
  deriving (Show, Data, Generic, Eq)
instance Hashable TExpr

type TAlt = (Pat, Maybe TExpr, TExpr)

texprInfo :: TExpr -> Info
texprInfo = \case
  T_Var i _ -> i
  T_Lam i _ _ -> i
  T_App i _ _ -> i
  T_Bop i _ _ _ -> i
  T_Uop i _ _ -> i
  T_Lit i _ -> i
  T_Let i _ _ _ -> i
  T_Ite i _ _ _ -> i
  T_Seq i _ _ -> i
  T_Case i _ _ -> i
  T_Tuple i _ -> i
  T_ConApp i _ _ -> i
  T_Record i _ -> i
  T_Field i _ _ -> i
  T_SetField i _ _ _ -> i
  T_Array i _ -> i
  T_List i _ -> i
  T_Try i _ _ -> i


tfold :: Monoid a => (TExpr -> a -> a) -> a -> TExpr -> a
tfold f z = go
  where
  go e = f e $ case e of
    T_Var {} -> z
    T_Lam _ _ b -> go b
    T_App _ f es -> mconcat $ map go (f:es)
    T_Bop _ _ e1 e2 -> mappend (go e1) (go e2)
    T_Uop _ _ e -> go e
    T_Lit {} -> z
    T_Let _ _ pes e -> mconcat (map (go.snd) pes ++ [go e])
    T_Ite _ x y z -> go x <> go y <> go z
    T_Seq _ e1 e2 -> mappend (go e1) (go e2)
    T_Case _ e as -> mconcat (go e : map (go.thd3) as)
    T_Tuple _ es -> mconcat (map go es)
    T_ConApp _ _ me -> maybe mempty go me
    T_Record _ fes -> mconcat (map (go.snd) fes)
    T_Field _ e _ -> go e
    T_SetField _ e1 _ e2 -> mappend (go e1) (go e2)
    T_List _ es -> mconcat (map go es)
    T_Array _ es -> mconcat (map go es)
    T_Try _ e as -> mconcat (go e : map (go.thd3) as)


count_tcon :: TCon -> TExpr -> Double
count_tcon c = getSum . tfold f mempty
  where
  f e acc = acc <> case getType e of
                     TApp c' _ -> Sum . bool2double $ c == c'
                     TTup _ -> Sum . bool2double $ c == "Tuple"
                     _ :-> _ -> Sum . bool2double $ c == "Fun"
                     _ -> mempty

has_tcon :: TCon -> TExpr -> Double
has_tcon c = bool2double . (>0) . count_tcon c

is_tcon :: TCon -> TExpr -> Double
is_tcon c e = case getType e of
                TApp c' _ -> bool2double $ c == c'
                TTup _ -> bool2double $ c == "Tuple"
                _ :-> _ -> bool2double $ c == "Fun"
                _ -> 0


getType :: TExpr -> Type
getType = infoType . texprInfo

type TypeEnv = Map Var Type

lookupVarType :: MonadEval m => Var -> m Type
lookupVarType v = do
  env <- gets stVarTypes
  case Map.lookup v env of
    Just t  -> return t
    Nothing -> do
      -- TODO: should be impossible..
      t <- TVar <$> freshTVar
      modify' $ \ s -> s { stVarTypes = Map.insert v t (stVarTypes s) }
      return t

-- TODO: do we want to do a traditional HM-style bottom-up inference, or
-- a bidirectional thing? since the interesting expressions will be
-- ill-typed, the choice may make a difference in how we type the bad bits
typeExpr :: MonadEval m => Expr -> m TExpr
-- for now let's do a bottom-up thing
typeExpr = \case
  Var ml v -> do
    -- NOTE: don't forget to instantiate
    t <- lookupVarType v
    return (T_Var (mkInfo ml t) v)
  Lam ml p e _ -> do
    (ti, bnds) <- typePat p
    te <- withLocalBinds bnds $ typeExpr e
    let t = ti :-> (getType te)
    return (T_Lam (mkInfo ml t) p te)
  App ml f es -> do
    tf <- typeExpr f
    tes <- mapM typeExpr es
    t <- TVar <$> freshTVar
    tryUnify (getType tf) (foldr (:->) t (map getType tes))
    return (T_App (mkInfo ml t) tf tes)
  Bop ml b e1 e2 -> do
    te1 <- typeExpr e1
    te2 <- typeExpr e2
    (t1, t2, t) <- if
      | b `elem` [Eq .. Ge]
        -> do { t <- TVar <$> freshTVar; return (t, t, tCon tBOOL) }
      | b `elem` [And, Or]
        -> return (tCon tBOOL, tCon tBOOL, tCon tBOOL)
      | b `elem` [Plus .. Mod]
        -> return (tCon tINT, tCon tINT, tCon tINT)
      | b `elem` [FPlus .. FExp]
        -> return (tCon tFLOAT, tCon tFLOAT, tCon tFLOAT)
    tryUnify t1 (getType te1)
    tryUnify t2 (getType te2)
    return (T_Bop (mkInfo ml t) b te1 te2)
  Uop ml u e -> do
    te <- typeExpr e
    let t = case u of
              Neg -> tCon tINT
              FNeg -> tCon tFLOAT
    tryUnify t (getType te)
    return (T_Uop (mkInfo ml t) u te)
  Lit ml l -> do
    let t = case l of
              LI {} -> tCon tINT
              LD {} -> tCon tFLOAT
              LB {} -> tCon tBOOL
              LC {} -> tCon tCHAR
              LS {} -> tCon tSTRING
    return (T_Lit (mkInfo ml t) l)
  Let ml r pes e -> do
    -- NOTE: don't forget to generalize
    (bnds, ptes) <- case r of
      Rec -> typeRecBinds pes
      NonRec -> first concat . unzip <$> mapM typeBind pes
    te <- withLocalBinds bnds $ typeExpr e
    return (T_Let (mkInfo ml (getType te)) r ptes te)
  Ite ml b t f -> do
    tb <- typeExpr b
    tt <- typeExpr t
    tf <- typeExpr f
    tryUnify (getType tb) (tCon tBOOL)
    tryUnify (getType tt) (getType tf)
    -- TODO: should we default to tt when tt !~ tf? Or use fresh a?
    return (T_Ite (mkInfo ml (getType tt)) tb tt tf)
  Seq ml e1 e2 -> do
    te1 <- typeExpr e1
    te2 <- typeExpr e2
    return (T_Seq (mkInfo ml (getType te2)) te1 te2)
  Case ml e as -> do
    te <- typeExpr e
    (tps, ta:tas) <- unzip <$> mapM typeAlt as
    mapM_ (tryUnify (getType te)) tps
    mapM_ (tryUnify (getType (thd3 ta))) (map (getType.thd3) tas)
    return (T_Case (mkInfo ml (getType (thd3 ta))) te (ta:tas))
  Tuple ml es -> do
    tes <- mapM typeExpr es
    return (T_Tuple (mkInfo ml (TTup (map getType tes))) tes)
  ConApp ml c me _ -> do
    d <- lookupDataCon c
    let tvs = tyVars (dType d)
    su <- fmap Map.fromList $ forM tvs $ \tv ->
      (tv,) . TVar <$> freshTVar
    mte <- case (map (subst su) (dArgs d), me) of
      ([], Nothing) -> return Nothing
      ([t], Just e) -> do
        te <- typeExpr e
        tryUnify t (getType te)
        return (Just te)
      (ts, Just (Tuple ml' es)) -> do
        tes <- mapM typeExpr es
        zipWithM tryUnify ts (map getType tes)
        return (Just (T_Tuple (mkInfo ml' (TTup (map getType tes))) tes))
      --FIXME:
      x -> trace ("typeExpr: ConApp: " ++ show (c, x)) $ return Nothing
    let t = subst su (typeDeclType (dType d))
    return (T_ConApp (mkInfo ml t) c mte)
  Array ml es _ -> do
    tes <- mapM typeExpr es
    t <- TVar <$> freshTVar
    mapM_ (tryUnify t . getType) tes
    return (T_Array (mkInfo ml (mkTApps tARRAY [t])) tes)
  List ml es _ -> do
    tes <- mapM typeExpr es
    t <- TVar <$> freshTVar
    mapM_ (tryUnify t . getType) tes
    return (T_List (mkInfo ml (mkTApps tLIST [t])) tes)
  -- these should not occur in the dataset
  Try ml e as -> do
    error "typeExpr: impossible: try"
  Record ml fes _ -> do
    error "typeExpr: impossible: record"
  Field ml e f -> do
    te <- typeExpr e
    td@TypeDecl {tyCon, tyRhs = TRec fs} <- lookupField f
    let tvs = tyVars td
    su <- fmap Map.fromList $ forM tvs $ \tv ->
      (tv,) . TVar <$> freshTVar
    tryUnify (getType te) (subst su (typeDeclType td))
    let Just t = lookup f [(x,z) | (x,y,z) <- fs]
    return (T_Field (mkInfo ml t) te f)
  SetField ml e f v -> do
    error "typeExpr: impossible: setfield"
  -- these should not occur at all in freshly parsed programs
  Prim1 {} -> do
    error "typeExpr: impossible"
  Prim2 {} -> do
    error "typeExpr: impossible"
  With {} -> do
    error "typeExpr: impossible"
  Replace {} -> do
    error "typeExpr: impossible"
  Hole {} -> do
    error "typeExpr: impossible"
  Ref {} -> do
    error "typeExpr: impossible"

typePat :: MonadEval m => Pat -> m (Type, [(Var, Type)])
typePat = \case
  VarPat _ v -> do
    t <- TVar <$> freshTVar
    return (t, [(v,t)])
  LitPat _ l -> do
    let t = typeOfLit l
    return (t, [])
  IntervalPat _ l1 l2 -> do
    let t1 = typeOfLit l1
    let t2 = typeOfLit l2
    tryUnify t1 t2
    return (t1, [])
  ConsPat _ p1 p2 -> do
    (t1, bnds1) <- typePat p1
    (t2, bnds2) <- typePat p2
    let t = mkTApps tLIST [t1]
    tryUnify t t2
    return (t, bnds1 ++ bnds2)
  ConPat _ c mp -> do
    d <- lookupDataCon c
    let tvs = tyVars (dType d)
    su <- fmap Map.fromList $ forM tvs $ \tv ->
      (tv,) . TVar <$> freshTVar
    bnds <- case (map (subst su) (dArgs d), mp) of
      ([], Nothing) -> return []
      ([t], Just p) -> do
        (tp, bnds) <- typePat p
        tryUnify t tp
        return bnds
      (ts, Just (TuplePat ml' ps)) -> do
        (tps, bndss) <- unzip <$> mapM typePat ps
        zipWithM tryUnify ts tps
        return (concat bndss)
      --FIXME:
      x -> trace ("typePat: ConPat: " ++ show (c, x)) $ return []
    let t = subst su (typeDeclType (dType d))
    return (t, bnds)
  ListPat _ ps -> do
    (t:ts, bndss) <- unzip <$> mapM typePat ps
    mapM_ (tryUnify t) ts
    return (mkTApps tLIST [t], concat bndss)
  TuplePat _ ps -> do
    (ts, bndss) <- unzip <$> mapM typePat ps
    return (TTup ts, concat bndss)
  WildPat _ -> do
    t <- TVar <$> freshTVar
    return (t, [])
  OrPat _ p1 p2 -> do
    (tp1, bnds1) <- typePat p1
    (tp2, bnds2) <- typePat p2
    tryUnify tp1 tp2
    return (tp1, bnds1 ++ bnds2)
  AsPat _ p v -> do
    (tp, bnds) <- typePat p
    return (tp, (v,tp) : bnds)
  ConstraintPat _ p t -> do
    (tp, bnds) <- typePat p
    tryUnify tp t
    return (tp, bnds)

typeAlt :: MonadEval m => Alt -> m (Type, TAlt)
typeAlt (p, mg, e) = do
  (tp, bnds) <- typePat p
  withLocalBinds bnds $ do
    tg <- case mg of
      Nothing -> return Nothing
      Just g  -> do
        tg <- typeExpr g
        tryUnify (tCon tBOOL) (getType tg)
        return (Just tg)
    te <- typeExpr e
    return (tp, (p, tg, te))

typeBind :: MonadEval m => (Pat, Expr) -> m ([(Var, Type)], (Pat, TExpr))
typeBind (p, e) = do
  te <- typeExpr e
  (tp, bnds) <- typePat p
  tryUnify tp (getType te)
  return (bnds, (p, te))

typeRecBinds :: MonadEval m => [(Pat, Expr)] -> m ([(Var, Type)], [(Pat, TExpr)])
typeRecBinds pes = do
  let (ps, es) = unzip pes
  (tps, bndss) <- unzip <$> mapM typePat ps
  tes <- withLocalBinds (concat bndss) $ forM (zip tps es) $ \ (tp, e) -> do
    te <- typeExpr e
    tryUnify tp (getType te)
    return te
  return (concat bndss, zip ps tes)
  -- mfix $ \ (bnds, _tpes) -> do
  --   withLocalBinds bnds $ first concat . unzip <$> mapM typeBind pes

-- | Try to unify two types but suppress any errors.
tryUnify :: MonadEval m => Type -> Type -> m ()
tryUnify t1 t2 = unify t1 t2 `catchError` \_ -> return ()

withLocalBinds :: MonadEval m => [(Var, Type)] -> m a -> m a
withLocalBinds bnds do_this = do
  tenv <- gets stVarTypes
  modify' $ \ s -> s { stVarTypes = foldr (uncurry Map.insert) (stVarTypes s) bnds }
  a <- do_this
  modify' $ \ s -> s { stVarTypes = tenv }
  return a
