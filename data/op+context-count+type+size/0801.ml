
let pipe fs =
  let rec iter acc curr =
    match curr with | [] -> acc | h::tl -> iter (h curr) tl in
  iter (fun y  -> y) fs;;


(* fix

let id y = y;;

let pipe fs =
  let rec iter acc curr =
    match curr with | [] -> acc | h::tl -> iter (fun x  -> h (acc x)) tl in
  iter id fs;;

*)

(* changed spans
(2,10)-(5,24)
(4,50)-(4,56)
(4,52)-(4,56)
(4,58)-(4,60)
(5,3)-(5,7)
(5,9)-(5,20)
(5,19)-(5,20)
(5,22)-(5,24)
*)

(* type error slice
(3,3)-(5,24)
(3,16)-(4,60)
(3,20)-(4,60)
(4,5)-(4,60)
(4,11)-(4,15)
(4,29)-(4,32)
(4,44)-(4,48)
(4,44)-(4,60)
(4,58)-(4,60)
*)