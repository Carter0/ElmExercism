module Grains exposing (square)

{-
   1 2 4 8 16
-}


square : Int -> Maybe Int
square n =
    if n <= 0 then
        Nothing

    else
        Just (squareHelper 1 n)


squareHelper : Int -> Int -> Int
squareHelper acc countdown =
    if countdown == 1 then
        acc

    else
        squareHelper (acc * 2) (countdown - 1)
