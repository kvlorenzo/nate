
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,47)
seen
VarG

(7,44)-(7,47)
h :: seen
ConAppG (Just (TupleG [VarG,VarG])) Nothing

(8,8)-(8,46)
h
VarG

(8,8)-(8,46)
seen
VarG

(8,8)-(8,46)
h :: seen
ConAppG (Just (TupleG [VarG,VarG])) Nothing

*)