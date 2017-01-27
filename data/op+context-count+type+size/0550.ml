
let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f - (1 hd) in
  List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a + (x * x) in
  let base = match xs with | [] -> 0 | hd::tl -> f 0 hd in
  List.fold_left f base xs;;

*)

(* changed spans
(3,20)-(3,21)
(3,24)-(3,25)
(4,50)-(4,59)
(4,55)-(4,56)
(4,55)-(4,59)
*)

(* type error slice
(3,3)-(5,27)
(3,9)-(3,25)
(3,11)-(3,25)
(3,15)-(3,16)
(3,15)-(3,25)
(3,20)-(3,21)
(3,20)-(3,25)
(4,50)-(4,51)
(4,50)-(4,59)
(4,55)-(4,56)
(4,55)-(4,59)
(4,57)-(4,59)
*)
