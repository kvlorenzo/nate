
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev helper ([], l);;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(9,2)-(9,25)
List.rev (helper ([] , l))
AppG (fromList [AppG (fromList [EmptyG])])

(9,11)-(9,17)
helper ([] , l)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
