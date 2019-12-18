module CollatzConjecture exposing (collatz)

{-
   If n is even, divide n by 2 to get n / 2. If n is odd, multiply n by 3 and add 1 to get 3n + 1
-}


collatz : Int -> Result String Int
collatz start =
    if start <= 0 then
        Result.Err "Only positive numbers are allowed"

    else
        Result.Ok (collatzHelper start 0)


collatzHelper : Int -> Int -> Int
collatzHelper start counter =
    if start == 1 then
        counter

    else if modBy 2 start == 0 then
        collatzHelper (start // 2) (counter + 1)

    else
        collatzHelper (3 * start + 1) (counter + 1)
