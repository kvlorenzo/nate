
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
(2,9)-(5,23)
fun y -> y
LamG VarG

(4,48)-(4,56)
fun x -> h (acc x)
LamG (AppG (fromList [EmptyG]))

(4,51)-(4,55)
acc x
AppG (fromList [VarG])

(4,57)-(4,59)
x
VarG

(5,7)-(5,20)
EMPTY
EmptyG

(5,18)-(5,19)
id
VarG

*)
