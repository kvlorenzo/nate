
let pipe fs =
  let f a x g b y z = match y with | [] -> z | _ -> b a in
  let base = f 0 [] in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(4,48)
(3,13)-(3,56)
(3,15)-(3,56)
(3,17)-(3,56)
(3,19)-(3,56)
(3,23)-(3,56)
(3,29)-(3,30)
(3,44)-(3,45)
(3,53)-(3,54)
(4,14)-(4,20)
*)

(* type error slice
(3,3)-(4,48)
(3,9)-(3,56)
(3,11)-(3,56)
(3,13)-(3,56)
(3,15)-(3,56)
(3,17)-(3,56)
(3,19)-(3,56)
(3,23)-(3,56)
(3,29)-(3,30)
(3,44)-(3,45)
(3,53)-(3,54)
(3,53)-(3,56)
(3,55)-(3,56)
(4,3)-(4,48)
(4,14)-(4,15)
(4,14)-(4,20)
(4,16)-(4,17)
(4,18)-(4,20)
(4,24)-(4,38)
(4,24)-(4,48)
(4,39)-(4,40)
(4,41)-(4,45)
(4,46)-(4,48)
*)
