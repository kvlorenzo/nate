
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tangent of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let exp = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exp a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exp a) ^ ")")
  | Average (a,b) -> "((" ^ ((exp a) ^ ("+" ^ ((exp b) ^ ")/2)")))
  | Times (a,b) -> (exp a) ^ ("*" ^ (exp b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exp a) ^
           ("<" ^ ((exp b) ^ ("?" ^ ((exp c) ^ (":" ^ ((exp d) ^ ")")))))))
  | Tangent a ->
      "sin(pi*" ^ ((exp a) ^ (")/(" ("cos(pi*" ^ ((exp a) ^ ")")) ")"));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Hoi of expr* expr* expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let exp = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exp a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exp a) ^ ")")
  | Average (a,b) -> "((" ^ ((exp a) ^ ("+" ^ ((exp b) ^ ")/2)")))
  | Times (a,b) -> (exp a) ^ ("*" ^ (exp b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exp a) ^
           ("<" ^ ((exp b) ^ ("?" ^ ((exp c) ^ (":" ^ ((exp d) ^ ")")))))))
  | Hoi (a,b,c) ->
      "sin(pi*" ^
        ((exp a) ^ (")*cos(pi*" ^ ((exp b) ^ (")/(" ^ ((exp c) ^ ")")))));;

*)

(* changed spans
(14,2)-(26,71)
(26,30)-(26,35)
(26,36)-(26,65)
(26,37)-(26,46)
(26,55)-(26,56)
(26,60)-(26,63)
(26,66)-(26,69)
*)

(* type error slice
(26,29)-(26,70)
(26,30)-(26,35)
*)

(* all spans
(12,21)-(26,71)
(13,2)-(26,71)
(13,12)-(13,24)
(14,2)-(26,71)
(14,8)-(14,9)
(15,13)-(15,16)
(16,13)-(16,16)
(17,14)-(17,41)
(17,24)-(17,25)
(17,14)-(17,23)
(17,26)-(17,41)
(17,35)-(17,36)
(17,27)-(17,34)
(17,28)-(17,31)
(17,32)-(17,33)
(17,37)-(17,40)
(18,16)-(18,43)
(18,26)-(18,27)
(18,16)-(18,25)
(18,28)-(18,43)
(18,37)-(18,38)
(18,29)-(18,36)
(18,30)-(18,33)
(18,34)-(18,35)
(18,39)-(18,42)
(19,21)-(19,66)
(19,26)-(19,27)
(19,21)-(19,25)
(19,28)-(19,66)
(19,37)-(19,38)
(19,29)-(19,36)
(19,30)-(19,33)
(19,34)-(19,35)
(19,39)-(19,65)
(19,44)-(19,45)
(19,40)-(19,43)
(19,46)-(19,64)
(19,55)-(19,56)
(19,47)-(19,54)
(19,48)-(19,51)
(19,52)-(19,53)
(19,57)-(19,63)
(20,19)-(20,44)
(20,27)-(20,28)
(20,19)-(20,26)
(20,20)-(20,23)
(20,24)-(20,25)
(20,29)-(20,44)
(20,34)-(20,35)
(20,30)-(20,33)
(20,36)-(20,43)
(20,37)-(20,40)
(20,41)-(20,42)
(22,6)-(24,75)
(22,10)-(22,11)
(22,6)-(22,9)
(23,8)-(24,75)
(23,17)-(23,18)
(23,9)-(23,16)
(23,10)-(23,13)
(23,14)-(23,15)
(24,11)-(24,74)
(24,16)-(24,17)
(24,12)-(24,15)
(24,18)-(24,73)
(24,27)-(24,28)
(24,19)-(24,26)
(24,20)-(24,23)
(24,24)-(24,25)
(24,29)-(24,72)
(24,34)-(24,35)
(24,30)-(24,33)
(24,36)-(24,71)
(24,45)-(24,46)
(24,37)-(24,44)
(24,38)-(24,41)
(24,42)-(24,43)
(24,47)-(24,70)
(24,52)-(24,53)
(24,48)-(24,51)
(24,54)-(24,69)
(24,63)-(24,64)
(24,55)-(24,62)
(24,56)-(24,59)
(24,60)-(24,61)
(24,65)-(24,68)
(26,6)-(26,71)
(26,16)-(26,17)
(26,6)-(26,15)
(26,18)-(26,71)
(26,27)-(26,28)
(26,19)-(26,26)
(26,20)-(26,23)
(26,24)-(26,25)
(26,29)-(26,70)
(26,30)-(26,35)
(26,36)-(26,65)
(26,47)-(26,48)
(26,37)-(26,46)
(26,49)-(26,64)
(26,58)-(26,59)
(26,50)-(26,57)
(26,51)-(26,54)
(26,55)-(26,56)
(26,60)-(26,63)
(26,66)-(26,69)
*)
