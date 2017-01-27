
let rec listReverse l =
  match l with
  | _ -> []
  | x -> [x]
  | head::tail -> (listReverse tail) :: head;;


(* fix

let x = [1; 2; 3];;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail::t::s -> head :: tail :: t :: s;;

*)

(* changed spans
(2,21)-(6,45)
(3,3)-(6,45)
(6,20)-(6,31)
(6,20)-(6,36)
(6,32)-(6,36)
*)

(* type error slice
(2,4)-(6,47)
(2,21)-(6,45)
(3,3)-(6,45)
(3,9)-(3,10)
(4,10)-(4,12)
(6,20)-(6,31)
(6,20)-(6,36)
(6,20)-(6,45)
(6,32)-(6,36)
*)
