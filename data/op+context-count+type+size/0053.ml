
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> [mulByDigit i (List.rev l); h * i];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t -> (mulByDigit i (List.rev l)) @ [h * i];;

*)

(* changed spans
(5,13)-(5,47)
(5,14)-(5,24)
(5,41)-(5,46)
*)

(* type error slice
(2,4)-(5,49)
(2,20)-(5,47)
(2,22)-(5,47)
(3,3)-(5,47)
(3,9)-(3,17)
(3,9)-(3,19)
(3,18)-(3,19)
(4,11)-(4,13)
(5,14)-(5,24)
(5,14)-(5,38)
(5,25)-(5,26)
(5,28)-(5,36)
(5,28)-(5,38)
(5,37)-(5,38)
(5,41)-(5,46)
(5,45)-(5,46)
*)