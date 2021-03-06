
let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let digits = digitsOfInt n in
  let s = sumList digits in if (n / 10) <> 0 then digitalRoot else digits;;


(* fix

let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let d = digits n in
  let s = sumList d in if (n / 10) <> 0 then digitalRoot s else s;;

*)

(* changed spans
(8,16)-(8,70)
fun n -> digitsOfInt (abs n)
LamG (AppG (fromList [EmptyG]))

(11,2)-(12,73)
let d = digits n in
let s = sumList d in
if (n / 10) <> 0
then digitalRoot s
else s
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(11,15)-(11,26)
digits
VarG

(12,18)-(12,24)
d
VarG

(12,50)-(12,61)
digitalRoot s
AppG (fromList [VarG])

(12,67)-(12,73)
s
VarG

*)
