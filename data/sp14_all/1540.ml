
let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = [] in List.fold_left f base xs;;


(* fix

let sqsum xs =
  let f a x = match xs with | [] -> a | hd::tl -> a + (hd * hd) in
  let base = f 4 xs in List.fold_left f base xs;;

*)

(* changed spans
(4,13)-(4,15)
f 4 xs
AppG (fromList [VarG,LitG])

(4,19)-(4,43)
xs
VarG

*)
