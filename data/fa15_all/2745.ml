
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let carry x y = (x * y) / 10;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let remain x = x mod 10;;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (car,cur) ->
               (match cur with
                | [] ->
                    if ((car + x1) + x2) > 10
                    then
                      ((car + 1), ([car + 1] @ [remain ((car + x1) + x2)]))
                    else (0, ([car] @ [(car + x1) + x2]))
                | h::t ->
                    if ((x1 + x2) + h) < 10
                    then (0, ([0] @ ([(x1 + x2) + h] @ t)))
                    else
                      ((car + 1),
                        ([carry ((h + x1) + x2)] @
                           ([remain ((h + x1) + x2)] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let remain x = x mod 10;;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (car,cur) ->
               (match cur with
                | [] ->
                    if ((car + x1) + x2) > 10
                    then
                      ((car + 1), ([car + 1] @ [remain ((car + x1) + x2)]))
                    else (0, ([car] @ [(car + x1) + x2]))
                | h::t ->
                    if ((x1 + x2) + h) < 10
                    then (0, ([0] @ ([(x1 + x2) + h] @ t)))
                    else
                      ((car + 1),
                        ([((h + x1) + x2) / 10] @
                           ([((h + x1) + x2) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(4,10)-(4,28)
EMPTY
EmptyG

(4,12)-(4,28)
EMPTY
EmptyG

(4,16)-(4,23)
EMPTY
EmptyG

(4,16)-(4,28)
EMPTY
EmptyG

(4,17)-(4,18)
EMPTY
EmptyG

(4,21)-(4,22)
EMPTY
EmptyG

(4,26)-(4,28)
EMPTY
EmptyG

(36,26)-(36,31)
((h + x1) + x2) / 10
BopG (BopG EmptyG EmptyG) LitG

(36,26)-(36,47)
EMPTY
EmptyG

(37,27)-(37,57)
10
LitG

(37,29)-(37,35)
((h + x1) + x2) mod 10
BopG (BopG EmptyG EmptyG) LitG

(37,29)-(37,51)
EMPTY
EmptyG

(37,55)-(37,56)
10
LitG

*)
