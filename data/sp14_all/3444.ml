
let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = [0] in
  if (sumList (digitsOfInt n)) > 9
  then 1 :: (count additivePersistence (sumList (digitsOfInt n)));;


(* fix

let rec digitsOfInt n =
  if n <= 0
  then []
  else List.rev ((n mod 10) :: (List.rev (digitsOfInt (n / 10))));;

let rec sumList xs =
  match xs with | [] -> 0 | h::t -> h + (sumList t) | _ -> (-1);;

let rec additivePersistence n =
  let count = [0] in
  if (sumList (digitsOfInt n)) > 9
  then additivePersistence (sumList (digitsOfInt n))
  else sumList count;;

*)

(* changed spans
(12,2)-(13,65)
sumList count
AppG (fromList [VarG])

(13,7)-(13,8)
EMPTY
EmptyG

(13,7)-(13,65)
EMPTY
EmptyG

(13,12)-(13,65)
EMPTY
EmptyG

(13,13)-(13,18)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)
