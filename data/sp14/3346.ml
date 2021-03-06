
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [helper [] (h * i)]
       with
       | [] -> []
       | h::t -> h);;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
        ((helper [] (h * i)) @ []);;

*)

(* changed spans
(8,6)-(12,19)
(9,15)-(9,34)
(9,16)-(9,22)
(12,17)-(12,18)
*)

(* type error slice
(2,3)-(12,21)
(2,19)-(12,19)
(2,21)-(12,19)
(3,2)-(12,19)
(6,6)-(12,19)
(8,6)-(12,19)
(8,13)-(8,70)
(8,13)-(9,34)
(8,14)-(8,24)
(8,71)-(8,72)
(12,17)-(12,18)
*)

(* all spans
(2,19)-(12,19)
(2,21)-(12,19)
(3,2)-(12,19)
(3,8)-(3,9)
(4,10)-(4,12)
(6,6)-(12,19)
(6,21)-(7,66)
(6,25)-(7,66)
(7,8)-(7,66)
(7,11)-(7,16)
(7,11)-(7,12)
(7,15)-(7,16)
(7,22)-(7,25)
(7,31)-(7,66)
(7,31)-(7,37)
(7,38)-(7,57)
(7,39)-(7,49)
(7,40)-(7,41)
(7,46)-(7,48)
(7,53)-(7,56)
(7,58)-(7,66)
(7,59)-(7,60)
(7,63)-(7,65)
(8,6)-(12,19)
(8,13)-(9,34)
(8,71)-(8,72)
(8,13)-(8,70)
(8,14)-(8,24)
(8,25)-(8,26)
(8,27)-(8,69)
(8,28)-(8,36)
(8,37)-(8,68)
(8,38)-(8,46)
(8,47)-(8,65)
(8,58)-(8,64)
(8,58)-(8,59)
(8,62)-(8,64)
(8,66)-(8,67)
(9,15)-(9,34)
(9,16)-(9,33)
(9,16)-(9,22)
(9,23)-(9,25)
(9,26)-(9,33)
(9,27)-(9,28)
(9,31)-(9,32)
(11,15)-(11,17)
(12,17)-(12,18)
*)
