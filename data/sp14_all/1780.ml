
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let l1 = [9; 9; 9];;

let rec mulByDigit i l =
  let f a x =
    let (i,j) = x in
    let (s,t) = a in ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev (0 :: l1)) (clone i ((List.length + 1) l)) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let l1 = [9; 9; 9];;

let rec mulByDigit i l =
  let f a x =
    let (i,j) = x in
    let (s,t) = a in ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev (0 :: l1)) (clone i ((List.length l) + 1)) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(12,47)-(12,68)
EMPTY
EmptyG

(12,49)-(12,60)
List.length l
AppG (fromList [VarG])

(12,63)-(12,64)
EMPTY
EmptyG

(13,2)-(13,49)
1
LitG

*)
