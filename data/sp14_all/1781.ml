
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    match i with
    | 0 -> []
    | _ ->
        let (i,j) = x in
        let (s,t) = a in
        ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
  let base = (0, []) in
  let args = List.combine (List.rev (0 :: l)) (clone i ((List.length l) + 1)) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec mulByDigit i l =
  let f a x =
    match i with
    | 0 -> (0, [])
    | _ ->
        let (i,j) = x in
        let (s,t) = a in
        ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
  let base = (0, []) in
  let args = List.combine (List.rev (0 :: l)) (clone i ((List.length l) + 1)) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(7,11)-(7,13)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

*)
