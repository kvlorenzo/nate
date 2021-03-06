
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [2] in
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
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(7,44)-(7,47)
EMPTY
EmptyG

(7,45)-(7,46)
EMPTY
EmptyG

(8,8)-(8,46)
seen
VarG

*)
