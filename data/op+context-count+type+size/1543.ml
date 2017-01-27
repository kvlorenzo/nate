
let pipe fs =
  let f a x = match x with | [] -> 1 | _ -> x a in
  let base = f 0 [] in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(3,3)-(4,48)
(3,15)-(3,48)
(3,21)-(3,22)
(3,36)-(3,37)
(4,14)-(4,15)
(4,14)-(4,20)
(4,16)-(4,17)
(4,18)-(4,20)
*)

(* type error slice
(3,3)-(4,48)
(3,9)-(3,48)
(3,11)-(3,48)
(3,15)-(3,48)
(3,21)-(3,22)
(3,36)-(3,37)
(3,45)-(3,46)
(3,45)-(3,48)
(3,47)-(3,48)
(4,14)-(4,15)
(4,14)-(4,20)
(4,16)-(4,17)
(4,18)-(4,20)
*)