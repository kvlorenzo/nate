
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then (seen []) @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [h] @ seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,69)
seen
VarG

(7,54)-(7,63)
EMPTY
EmptyG

(7,55)-(7,59)
EMPTY
EmptyG

(7,60)-(7,62)
EMPTY
EmptyG

(8,8)-(8,46)
seen
VarG

*)
