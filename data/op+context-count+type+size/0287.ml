
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [seen; h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,55)-(7,64)
(7,56)-(7,60)
(8,9)-(8,46)
*)

(* type error slice
(3,3)-(9,26)
(3,19)-(8,46)
(4,5)-(8,46)
(4,11)-(4,15)
(5,13)-(5,17)
(7,9)-(8,46)
(7,21)-(7,74)
(7,25)-(7,33)
(7,25)-(7,40)
(7,25)-(7,49)
(7,34)-(7,35)
(7,36)-(7,40)
(7,44)-(7,49)
(7,55)-(7,64)
(7,56)-(7,60)
(7,62)-(7,63)
(7,70)-(7,74)
(8,9)-(8,46)
(8,21)-(8,22)
(8,26)-(8,32)
(8,26)-(8,46)
(8,34)-(8,39)
(8,34)-(8,46)
(8,41)-(8,46)
*)
