module BinarySearch exposing (find)

import Array exposing (Array)


find : Int -> Array Int -> Maybe Int
find target xs =
    if Array.isEmpty xs then
        Nothing

    else
        binarySearch target xs 0


binarySearch : Int -> Array Int -> Int -> Maybe Int
binarySearch target xs indexCounter =
    let
        length =
            Array.length xs

        midIndex =
            length // 2

        midValue =
            Maybe.withDefault 0 <| Array.get midIndex xs
    in
    if midValue == target then
        Just (indexCounter + midIndex)

    else if length == 1 then
        Nothing

    else if midValue > target then
        binarySearch target (Array.slice 0 midIndex xs) indexCounter

    else
        binarySearch target (Array.slice midIndex length xs) (indexCounter + midIndex)
