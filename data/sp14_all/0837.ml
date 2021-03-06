
let rec addList xs = match xs with | [] -> 0 | h::t -> h + (addList t);;

let rec digitsOfInt n =
  if n < 1 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec additivePersistence n =
  let count = 0 in
  if (List.length (digitsOfInt n)) = 1
  then count
  else count = (count + (1 additivePersistence (addList (digitsOfInt n))));;


(* fix

let rec addList xs = match xs with | [] -> 0 | h::t -> h + (addList t);;

let rec digitsOfInt n =
  if n < 1 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec addNum n = if n < 10 then n else addList (digitsOfInt n);;

let rec addHelp (count,n) =
  if n < 10 then count + 1 else addHelp ((count + 1), (addNum n));;

let rec additivePersistence n = addHelp (0, n);;

*)

(* changed spans
(8,2)-(11,74)
EMPTY
EmptyG

(8,14)-(8,15)
EMPTY
EmptyG

(9,5)-(9,34)
n
VarG

(9,5)-(9,38)
n < 10
BopG VarG LitG

(9,6)-(9,17)
addList
VarG

(9,37)-(9,38)
EMPTY
EmptyG

(10,7)-(10,12)
EMPTY
EmptyG

(11,7)-(11,12)
if n < 10
then count + 1
else addHelp (count + 1 , addNum n)
IteG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG) (AppG (fromList [EmptyG]))

(11,7)-(11,74)
fun (count , n) ->
  if n < 10
  then count + 1
  else addHelp (count + 1 , addNum n)
LamG (IteG EmptyG EmptyG EmptyG)

(11,15)-(11,74)
addHelp (count + 1 , addNum n)
AppG (fromList [TupleG (fromList [EmptyG])])

(11,24)-(11,73)
EMPTY
EmptyG

(11,27)-(11,46)
EMPTY
EmptyG

(11,48)-(11,55)
addNum
VarG

(11,56)-(11,71)
fun n -> addHelp (0 , n)
LamG (AppG (fromList [EmptyG]))

(11,57)-(11,68)
addHelp
VarG

(11,69)-(11,70)
(0 , n)
TupleG (fromList [VarG,LitG])

*)
