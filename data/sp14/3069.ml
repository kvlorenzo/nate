
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec digitsOfInt n =
  if n = 0
  then [0]
  else
    (fun help  ->
       fun n  -> match n with | 0 -> [] | _ -> cat (help (n / 10)) (n mod 10));;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec help n = match n with | 0 -> [] | _ -> cat (help (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else help n;;

*)

(* changed spans
(5,2)-(9,78)
(5,5)-(5,6)
(5,5)-(5,10)
(5,9)-(5,10)
(6,7)-(6,10)
(6,8)-(6,9)
(8,4)-(9,78)
(9,7)-(9,77)
*)

(* type error slice
(5,2)-(9,78)
(6,7)-(6,10)
(8,4)-(9,78)
*)

(* all spans
(2,12)-(2,67)
(2,14)-(2,67)
(2,18)-(2,67)
(2,24)-(2,25)
(2,39)-(2,42)
(2,40)-(2,41)
(2,53)-(2,67)
(2,53)-(2,54)
(2,58)-(2,67)
(2,59)-(2,62)
(2,63)-(2,64)
(2,65)-(2,66)
(4,20)-(9,78)
(5,2)-(9,78)
(5,5)-(5,10)
(5,5)-(5,6)
(5,9)-(5,10)
(6,7)-(6,10)
(6,8)-(6,9)
(8,4)-(9,78)
(9,7)-(9,77)
(9,17)-(9,77)
(9,23)-(9,24)
(9,37)-(9,39)
(9,47)-(9,77)
(9,47)-(9,50)
(9,51)-(9,66)
(9,52)-(9,56)
(9,57)-(9,65)
(9,58)-(9,59)
(9,62)-(9,64)
(9,67)-(9,77)
(9,68)-(9,69)
(9,74)-(9,76)
*)
