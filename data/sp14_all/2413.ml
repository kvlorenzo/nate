
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: ((prod / 10) + (mulByDigit i t)) :: t
      else prod :: t;;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      if prod > 10
      then (prod mod 10) :: (prod / 10) :: (mulByDigit i t)
      else prod :: t;;

*)

(* changed spans
(8,28)-(8,60)
EMPTY
EmptyG

(8,64)-(8,65)
EMPTY
EmptyG

*)
