
let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs2 with | [] -> xs1 | hd::tl -> append (xs1 :: hd) tl in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;


(* fix

let rec digitsOfInt n =
  let rec append xs1 xs2 =
    match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2) in
  let rec helper x =
    match x with | 0 -> [] | m -> append (helper (m / 10)) [m mod 10] in
  helper n;;

*)

(* changed spans
(4,10)-(4,13)
EMPTY
EmptyG

(4,43)-(4,49)
xs2
VarG

(4,43)-(4,64)
EMPTY
EmptyG

(4,51)-(4,54)
EMPTY
EmptyG

(4,62)-(4,64)
append tl xs2
AppG (fromList [VarG])

(5,2)-(7,10)
xs2
VarG

*)
