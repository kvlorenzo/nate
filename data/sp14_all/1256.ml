
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper acc n lis =
    match n with | 1 -> lis + acc | _ -> helper (n - 1) (bigAdd l lis) in
  helper [0] i l;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper i l acc =
    match i with | 0 -> [0] | 1 -> l | _ -> helper (i - 1) l (bigAdd acc l) in
  helper i l [0];;

*)

(* changed spans
(27,17)-(28,70)
fun i ->
  fun l ->
    fun acc ->
      match i with
      | 0 -> [0]
      | 1 -> l
      | _ -> helper (i - 1) l
                    (bigAdd acc l)
LamG (LamG EmptyG)

(27,21)-(28,70)
EMPTY
EmptyG

(27,23)-(28,70)
EMPTY
EmptyG

(28,4)-(28,70)
EMPTY
EmptyG

(28,10)-(28,11)
EMPTY
EmptyG

(28,24)-(28,27)
EMPTY
EmptyG

(28,24)-(28,33)
EMPTY
EmptyG

(28,30)-(28,33)
EMPTY
EmptyG

(28,41)-(28,47)
helper (i - 1) l (bigAdd acc
                         l)
AppG (fromList [VarG,AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(28,41)-(28,70)
match i with
| 0 -> [0]
| 1 -> l
| _ -> helper (i - 1) l
              (bigAdd acc l)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(28,49)-(28,50)
i
VarG

(28,56)-(28,70)
l
VarG

(28,64)-(28,65)
acc
VarG

(28,66)-(28,69)
EMPTY
EmptyG

(29,9)-(29,12)
EMPTY
EmptyG

(29,10)-(29,11)
EMPTY
EmptyG

*)
