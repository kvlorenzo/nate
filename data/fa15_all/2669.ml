
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if (explode w) == (listReverse explode w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if (explode w) == (listReverse (explode w)) then true else false;;

*)

(* changed spans
(11,20)-(11,43)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

(11,33)-(11,40)
explode w
AppG (fromList [VarG])

*)
