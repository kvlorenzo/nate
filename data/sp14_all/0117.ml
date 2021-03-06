
let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g =
       let self = f b in
       match self with | b -> (self, true) | _ -> (self, false) in
     (g, b));;


(* fix

let rec wwhile (f,b) =
  let helper = f b in
  match helper with | (x,y) -> if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile
    (let g b =
       let self = f b in
       match b with | self -> (self, false) | _ -> (self, true) in
     (g, b));;

*)

(* changed spans
(9,7)-(10,63)
fun b ->
  (let self = f b in
   match b with
   | self -> (self , false)
   | _ -> (self , true))
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(10,7)-(10,63)
EMPTY
EmptyG

(10,13)-(10,17)
match b with
| self -> (self , false)
| _ -> (self , true)
CaseG VarG (fromList [(Nothing,TupleG (fromList [EmptyG]))])

(10,30)-(10,42)
b
VarG

(10,37)-(10,41)
false
LitG

(10,57)-(10,62)
true
LitG

*)
