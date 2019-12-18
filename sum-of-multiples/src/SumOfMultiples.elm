module SumOfMultiples exposing (..)

import Set exposing (..)


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples divisors limit =
    Set.foldr (+) 0 (removeDups divisors limit)


removeDups : List Int -> Int -> Set Int
removeDups divisors limit =
    Set.fromList (List.concatMap (generateMultiples limit) divisors)


generateMultiples : Int -> Int -> List Int
generateMultiples limit n =
    (limit - 1)
        // n
        |> List.range 1
        |> List.map ((*) n)
