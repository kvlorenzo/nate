
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
helper ((v mod 10) :: acc)
       (v / 10)
AppG (fromList [BopG EmptyG EmptyG,ConAppG (Just EmptyG) Nothing])

(9,31)-(9,68)
EMPTY
EmptyG

(9,39)-(9,49)
(v mod 10) :: acc
ConAppG (Just (TupleG (fromList [VarG,BopG VarG LitG]))) Nothing

(9,54)-(9,68)
EMPTY
EmptyG

(11,8)-(13,23)
List.hd [List.fold_left f base
                        (mulByDigit i
                                    (List.rev (List.map (fun x ->
                                                           x * 10)
                                                        t)) @ [h * i])]
AppG (fromList [ListG EmptyG Nothing])

*)
