
let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = 0 in
    let args =
      let rec pair list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair (t1, t2))
        | ([],[]) -> [] in
      pair l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (o,z) ->
               if ((o + x1) + x2) > 9
               then (1, ((((o + x1) + x2) mod 10) :: z))
               else (0, (((o + x1) + x2) :: z))) in
    let base = (0, []) in
    let args =
      let rec pair list1 list2 =
        match ((List.rev list1), (List.rev list2)) with
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair t1 t2)
        | (_,_) -> [] in
      pair l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,16)-(22,24)
EMPTY
EmptyG

(22,16)-(22,44)
EMPTY
EmptyG

(22,25)-(22,44)
match x with
| (x1 , x2) -> match a with
               | (o , z) -> if ((o + x1) + x2) > 9
                            then (1 , (((o + x1) + x2) mod 10) :: z)
                            else (0 , ((o + x1) + x2) :: z)
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(23,4)-(30,51)
match a with
| (o , z) -> if ((o + x1) + x2) > 9
             then (1 , (((o + x1) + x2) mod 10) :: z)
             else (0 , ((o + x1) + x2) :: z)
CaseG VarG (fromList [(Nothing,IteG EmptyG EmptyG EmptyG)])

(23,15)-(23,16)
(0 , [])
TupleG (fromList [LitG,ListG EmptyG Nothing])

(24,4)-(30,51)
[]
ListG EmptyG Nothing

(26,8)-(28,23)
match (List.rev list1 , List.rev list2) with
| (h1 :: t1 , h2 :: t2) -> (h1 , h2) :: (pair t1
                                              t2)
| (_ , _) -> []
CaseG (TupleG (fromList [EmptyG])) (fromList [(Nothing,ConAppG (Just EmptyG) Nothing),(Nothing,ListG EmptyG Nothing)])

(26,15)-(26,20)
List.rev list1
AppG (fromList [VarG])

(26,22)-(26,27)
List.rev list2
AppG (fromList [VarG])

(27,41)-(27,56)
pair t1 t2
AppG (fromList [VarG])

(27,47)-(27,55)
EMPTY
EmptyG

*)
