
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h t) then true else false in
        let rest' = failwith "to be written" in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then [] :: seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,37)
List.mem h t
AppG (fromList [VarG])

(7,32)-(7,37)
EMPTY
EmptyG

(7,43)-(7,47)
EMPTY
EmptyG

(7,53)-(7,58)
[] :: seen
ConAppG (Just (TupleG (fromList [VarG,ListG EmptyG Nothing]))) Nothing

(8,8)-(8,69)
[]
ListG EmptyG Nothing

(8,20)-(8,28)
EMPTY
EmptyG

(8,20)-(8,44)
EMPTY
EmptyG

(8,29)-(8,44)
t
VarG

*)
