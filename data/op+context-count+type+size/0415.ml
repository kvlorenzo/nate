
let rec assoc (d,k,l) =
  match k with | [] -> d | (lk,lv)::ls -> if k = lk then lv else assoc d k ls;;


(* fix

let rec assoc (d,k,l) =
  match l with
  | [] -> d
  | (lk,lv)::ls -> if k = lk then lv else assoc (d, k, ls);;

*)

(* changed spans
(3,9)-(3,10)
(3,66)-(3,78)
(3,72)-(3,73)
*)

(* type error slice
(2,4)-(3,80)
(2,16)-(3,78)
(3,3)-(3,78)
(3,9)-(3,10)
(3,24)-(3,25)
(3,43)-(3,78)
(3,46)-(3,47)
(3,46)-(3,52)
(3,50)-(3,52)
(3,58)-(3,60)
(3,66)-(3,71)
(3,66)-(3,78)
(3,72)-(3,73)
(3,74)-(3,75)
(3,76)-(3,78)
*)