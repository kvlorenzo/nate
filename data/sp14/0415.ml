
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then helper ((h :: seen), t) in
        let rest' = helper (seen', t) in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          if List.mem h seen
          then helper (seen, t)
          else helper ((h :: seen), t) in
        let rest' = helper (seen', t) in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,67)
(7,52)-(7,63)
*)

(* type error slice
(3,2)-(9,27)
(3,18)-(8,62)
(4,4)-(8,62)
(5,12)-(5,16)
(7,8)-(8,62)
(7,20)-(7,67)
(7,20)-(7,67)
(7,20)-(7,67)
(7,44)-(7,50)
(7,44)-(7,67)
(7,51)-(7,67)
(7,52)-(7,63)
(8,20)-(8,26)
(8,20)-(8,37)
(8,27)-(8,37)
(8,28)-(8,33)
(8,41)-(8,47)
(8,41)-(8,62)
(8,48)-(8,62)
(8,49)-(8,54)
(9,2)-(9,10)
(9,2)-(9,27)
(9,11)-(9,27)
(9,12)-(9,18)
*)

(* all spans
(2,21)-(9,27)
(3,2)-(9,27)
(3,18)-(8,62)
(4,4)-(8,62)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(8,62)
(7,20)-(7,67)
(7,23)-(7,38)
(7,23)-(7,31)
(7,32)-(7,33)
(7,34)-(7,38)
(7,44)-(7,67)
(7,44)-(7,50)
(7,51)-(7,67)
(7,52)-(7,63)
(7,53)-(7,54)
(7,58)-(7,62)
(7,65)-(7,66)
(7,20)-(7,67)
(8,8)-(8,62)
(8,20)-(8,37)
(8,20)-(8,26)
(8,27)-(8,37)
(8,28)-(8,33)
(8,35)-(8,36)
(8,41)-(8,62)
(8,41)-(8,47)
(8,48)-(8,62)
(8,49)-(8,54)
(8,56)-(8,61)
(9,2)-(9,27)
(9,2)-(9,10)
(9,11)-(9,27)
(9,12)-(9,18)
(9,19)-(9,26)
(9,20)-(9,22)
(9,24)-(9,25)
*)
