IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))
if depth < 1
then rand (0 , 2)
else rand (2 , 7)
if depth < 1
then rand (0 , 2)
else rand (2 , 7)
if depth < 1
then rand (0 , 2)
else rand (2 , 7)
if r (0 , 1) = 0
then buildX ()
else buildY ()
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
if eval (e1 , x , y) < eval (e2 , x , y)
then eval (e3 , x , y)
else eval (e4 , x , y)
if rand (0 , 1) = 0
then buildAverage (buildhelper (depth - 1)
                               (depth - 1)
                               expr , buildhelper (depth - 1)
                                                  (depth - 1)
                                                  expr)
else buildTimes (buildhelper (depth - 1)
                             (depth - 1)
                             expr , buildhelper (depth - 1)
                                                (depth - 1)
                                                expr)
if sumList (digits n) > 9
then digitalRoot (sumList (digits n))
else sumList (digits n)
