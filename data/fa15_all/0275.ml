
let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | _ -> c | h::t -> (((h * i) + c) mod 10) :: t in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;


(* fix

let cout (x,y) = (x * y) mod 10;;

let rec mulByDigit i l =
  let f a x =
    let c = cout (i, x) in
    match a with | _ -> [c] | h::t -> (((h * i) + c) mod 10) :: t in
  let base = [] in
  let args = List.rev l in let res = List.fold_left f base args in res;;

*)

(* changed spans
(7,24)-(7,25)
[c]
ListG VarG Nothing

*)
