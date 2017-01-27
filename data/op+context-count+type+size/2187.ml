
let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | h::t -> f h | [] -> (fun x  -> x) in
  List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x g = a (x g) in
  let base = match fs with | [] -> (fun x  -> x) | h::t -> f (fun x  -> x) h in
  List.fold_left f base fs;;

*)

(* changed spans
(4,14)-(4,62)
(4,38)-(4,39)
(4,38)-(4,41)
(4,40)-(4,41)
(5,3)-(5,27)
*)

(* type error slice
(3,3)-(5,27)
(3,9)-(3,23)
(3,11)-(3,23)
(3,13)-(3,23)
(3,17)-(3,18)
(3,17)-(3,23)
(3,20)-(3,21)
(3,20)-(3,23)
(3,22)-(3,23)
(4,3)-(5,27)
(4,14)-(4,62)
(4,20)-(4,22)
(4,38)-(4,39)
(4,38)-(4,41)
(4,40)-(4,41)
(5,3)-(5,17)
(5,3)-(5,27)
(5,18)-(5,19)
(5,20)-(5,24)
(5,25)-(5,27)
*)