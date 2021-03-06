
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if !(List.mem h seen) then h :: seen in
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
(7,20)-(7,56)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(7,23)-(7,24)
EMPTY
EmptyG

(7,23)-(7,41)
EMPTY
EmptyG

(8,8)-(8,46)
seen
VarG

*)
