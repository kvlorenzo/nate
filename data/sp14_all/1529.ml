
let sqsum xs = let f a x = a * a in let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = a * a in let base = f 2 xs in List.fold_left f base xs;;

*)

(* changed spans
(2,47)-(2,49)
f 2 xs
AppG (fromList [VarG,LitG])

(2,53)-(2,77)
xs
VarG

*)
