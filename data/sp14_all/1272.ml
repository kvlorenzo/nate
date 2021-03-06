
let digitsOfInt n =
  let rec lastDigit n acc =
    if n <= 0 then acc else lastDigit (n / 10) ((n mod 10) :: acc) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n count =
  match n with | [] -> count | _ -> sumList (digitsOfInt n) (count + 1);;


(* fix

let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with | 0 -> 0 | _ -> additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(3,22)-(4,66)
fun accu ->
  if n <= 0
  then accu
  else lastDigit (n / 10)
                 ((n mod 10) :: accu)
LamG (IteG EmptyG EmptyG EmptyG)

(4,19)-(4,22)
accu
VarG

(4,62)-(4,65)
accu
VarG

(9,30)-(10,71)
EMPTY
EmptyG

(10,2)-(10,71)
match n with
| 0 -> 0
| _ -> additivePersistence (sumList (digitsOfInt n))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

(10,23)-(10,28)
EMPTY
EmptyG

(10,36)-(10,43)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

(10,36)-(10,71)
0
LitG

(10,60)-(10,71)
EMPTY
EmptyG

(10,61)-(10,66)
EMPTY
EmptyG

(10,69)-(10,70)
EMPTY
EmptyG

*)
