
let pipe fs = let f a x c = a in let base b = b in List.fold_left f base fs;;


(* fix

let pipe fs =
  let f a x c = x (let fn d = d in fn) in
  let base b = b in List.fold_left f base fs;;

*)

(* changed spans
(2,28)-(2,29)
x (let fn = fun d -> d in fn)
AppG (fromList [LetG NonRec (fromList [EmptyG]) EmptyG])

(2,33)-(2,75)
let fn = fun d -> d in fn
LetG NonRec (fromList [LamG EmptyG]) VarG

*)
