
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | [] -> a
      | h::t -> ((((fst h) + (snd h)) / 10), (((fst h) + (snd h)) mod 10)) ::
          t in
    let base = (0, []) in
    let args = [((List.combine l1), l2)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let leng1 = List.length l1 in
  let leng2 = List.length l2 in
  (((clone 0 (leng2 - leng1)) @ l1), ((clone 0 (leng1 - leng2)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(18,11)
EMPTY
EmptyG

(15,12)-(15,13)
EMPTY
EmptyG

(17,16)-(17,74)
EMPTY
EmptyG

(17,16)-(18,11)
EMPTY
EmptyG

(17,17)-(17,43)
EMPTY
EmptyG

(17,18)-(17,37)
EMPTY
EmptyG

(17,19)-(17,26)
EMPTY
EmptyG

(17,20)-(17,23)
EMPTY
EmptyG

(17,24)-(17,25)
EMPTY
EmptyG

(17,29)-(17,36)
EMPTY
EmptyG

(17,30)-(17,33)
EMPTY
EmptyG

(17,34)-(17,35)
EMPTY
EmptyG

(17,40)-(17,42)
EMPTY
EmptyG

(17,45)-(17,73)
EMPTY
EmptyG

(17,46)-(17,65)
EMPTY
EmptyG

(17,47)-(17,54)
EMPTY
EmptyG

(17,48)-(17,51)
EMPTY
EmptyG

(17,52)-(17,53)
EMPTY
EmptyG

(17,57)-(17,64)
EMPTY
EmptyG

(17,58)-(17,61)
EMPTY
EmptyG

(17,62)-(17,63)
EMPTY
EmptyG

(17,70)-(17,72)
EMPTY
EmptyG

(18,10)-(18,11)
EMPTY
EmptyG

(20,15)-(20,40)
EMPTY
EmptyG

(20,16)-(20,39)
EMPTY
EmptyG

(20,17)-(20,34)
List.combine l1 l2
AppG (fromList [VarG])

*)
