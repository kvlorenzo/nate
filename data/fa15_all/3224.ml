
let rec mulByDigit i l =
  match l with
  | [] -> [0]
  | x::x' -> [[(x * i) / 10]; ((x * i) mod 10) + (mulByDigit i x')];;


(* fix

let rec mulByDigit i l =
  match l with
  | [] -> []
  | x::x'::x'' ->
      [(x * i) / 10] @
        ([((x * i) mod 10) + x'] @ ((mulByDigit i [x']) @ x''));;

*)

(* changed spans
(3,2)-(5,67)
match l with
| [] -> []
| x :: x' :: x'' -> [(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                                            [x'] @ x''))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(4,10)-(4,13)
EMPTY
EmptyG

(4,11)-(4,12)
EMPTY
EmptyG

(5,13)-(5,67)
[]
ListG EmptyG Nothing

(5,14)-(5,28)
[(x * i) / 10] @ ([((x * i) mod 10) + x'] @ (mulByDigit i
                                                        [x'] @ x''))
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(5,30)-(5,66)
[((x * i) mod 10) + x'] @ (mulByDigit i
                                      [x'] @ x'')
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(5,49)-(5,66)
x'
VarG

(5,50)-(5,60)
mulByDigit i [x']
AppG (fromList [VarG,ListG EmptyG Nothing])

(5,63)-(5,65)
[x']
ListG VarG Nothing

*)
