
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l = failwith "to be implemented";;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (y,z) ->
          let sum = y + z in
          (match a with
           | h::t -> ((sum + h) / 10) :: ((sum + h) mod 10) :: t
           | _ -> [sum / 10; sum mod 10]) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(6,7)-(6,59)
(7,7)-(7,59)
(9,23)-(9,31)
(9,23)-(9,51)
(9,32)-(9,51)
(11,11)-(17,34)
(12,2)-(17,34)
(13,4)-(16,51)
(13,16)-(13,24)
(13,16)-(13,44)
(13,25)-(13,44)
(14,4)-(16,51)
(14,15)-(14,23)
(14,15)-(14,43)
(14,24)-(14,43)
(15,4)-(16,51)
(15,15)-(15,23)
(15,15)-(15,43)
(15,24)-(15,43)
(16,4)-(16,51)
(16,18)-(16,44)
(16,48)-(16,51)
*)

(* type error slice
(4,3)-(7,61)
(4,12)-(7,59)
(4,15)-(7,59)
(5,2)-(7,59)
(6,7)-(6,59)
(6,55)-(6,56)
(12,2)-(17,34)
(12,11)-(16,51)
(17,13)-(17,34)
(17,14)-(17,17)
(17,18)-(17,33)
(17,19)-(17,26)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(7,59)
(4,15)-(7,59)
(5,2)-(7,59)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,59)
(6,55)-(6,56)
(6,7)-(6,54)
(6,8)-(6,13)
(6,14)-(6,15)
(6,16)-(6,53)
(6,17)-(6,33)
(6,18)-(6,29)
(6,30)-(6,32)
(6,36)-(6,52)
(6,37)-(6,48)
(6,49)-(6,51)
(6,57)-(6,59)
(7,7)-(7,59)
(7,55)-(7,56)
(7,7)-(7,54)
(7,8)-(7,13)
(7,14)-(7,15)
(7,16)-(7,53)
(7,17)-(7,33)
(7,18)-(7,29)
(7,30)-(7,32)
(7,36)-(7,52)
(7,37)-(7,48)
(7,49)-(7,51)
(7,57)-(7,59)
(9,19)-(9,51)
(9,23)-(9,51)
(9,23)-(9,31)
(9,32)-(9,51)
(11,11)-(17,34)
(11,14)-(17,34)
(12,2)-(17,34)
(12,11)-(16,51)
(13,4)-(16,51)
(13,10)-(13,44)
(13,12)-(13,44)
(13,16)-(13,44)
(13,16)-(13,24)
(13,25)-(13,44)
(14,4)-(16,51)
(14,15)-(14,43)
(14,15)-(14,23)
(14,24)-(14,43)
(15,4)-(16,51)
(15,15)-(15,43)
(15,15)-(15,23)
(15,24)-(15,43)
(16,4)-(16,51)
(16,18)-(16,44)
(16,18)-(16,32)
(16,33)-(16,34)
(16,35)-(16,39)
(16,40)-(16,44)
(16,48)-(16,51)
(17,2)-(17,34)
(17,2)-(17,12)
(17,13)-(17,34)
(17,14)-(17,17)
(17,18)-(17,33)
(17,19)-(17,26)
(17,27)-(17,29)
(17,30)-(17,32)
*)