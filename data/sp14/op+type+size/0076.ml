
let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let f a x = a + x in
      let base = 0 in
      let rec helper acc v =
        if v = 0 then acc else (helper (v mod 10)) :: (acc (v / 10)) in
      helper []
        [List.fold_left f base
           ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
              [h * i])];;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let f a x = a + x in
      let base = 0 in
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      helper []
        (List.hd
           [List.fold_left f base
              ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
                 [h * i])]);;

*)

(* changed spans
(9,31)-(9,50)
(9,31)-(9,68)
(9,39)-(9,49)
(9,54)-(9,68)
(11,8)-(13,23)
*)

(* type error slice
(8,6)-(13,23)
(8,21)-(9,68)
(9,8)-(9,68)
(9,8)-(9,68)
(9,22)-(9,25)
(9,31)-(9,50)
(9,31)-(9,68)
(9,32)-(9,38)
(9,39)-(9,49)
(9,54)-(9,68)
(9,55)-(9,58)
(10,6)-(10,12)
(10,6)-(13,23)
(10,13)-(10,15)
*)

(* all spans
(2,19)-(13,23)
(2,21)-(13,23)
(3,2)-(13,23)
(3,8)-(3,18)
(3,8)-(3,16)
(3,17)-(3,18)
(4,10)-(4,12)
(6,6)-(13,23)
(6,12)-(6,23)
(6,14)-(6,23)
(6,18)-(6,23)
(6,18)-(6,19)
(6,22)-(6,23)
(7,6)-(13,23)
(7,17)-(7,18)
(8,6)-(13,23)
(8,21)-(9,68)
(8,25)-(9,68)
(9,8)-(9,68)
(9,11)-(9,16)
(9,11)-(9,12)
(9,15)-(9,16)
(9,22)-(9,25)
(9,31)-(9,68)
(9,31)-(9,50)
(9,32)-(9,38)
(9,39)-(9,49)
(9,40)-(9,41)
(9,46)-(9,48)
(9,54)-(9,68)
(9,55)-(9,58)
(9,59)-(9,67)
(9,60)-(9,61)
(9,64)-(9,66)
(10,6)-(13,23)
(10,6)-(10,12)
(10,13)-(10,15)
(11,8)-(13,23)
(11,9)-(13,22)
(11,9)-(11,23)
(11,24)-(11,25)
(11,26)-(11,30)
(12,11)-(13,22)
(12,70)-(12,71)
(12,12)-(12,69)
(12,13)-(12,23)
(12,24)-(12,25)
(12,26)-(12,68)
(12,27)-(12,35)
(12,36)-(12,67)
(12,37)-(12,45)
(12,46)-(12,64)
(12,57)-(12,63)
(12,57)-(12,58)
(12,61)-(12,63)
(12,65)-(12,66)
(13,14)-(13,21)
(13,15)-(13,20)
(13,15)-(13,16)
(13,19)-(13,20)
*)