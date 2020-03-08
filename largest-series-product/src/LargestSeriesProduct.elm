module LargestSeriesProduct exposing (largestProduct)


largestProduct : Int -> String -> Maybe Int
largestProduct length series =
    let
        return1 =
            length
                == 0
                && String.isEmpty series

        returnNothing =
            not (length == 0)
                && List.isEmpty inputList
                || not (List.all Char.isDigit (String.toList series))

        inputList =
            List.map
                (\x -> Char.toCode x - Char.toCode '0')
                (String.toList series)
    in
    if returnNothing then
        Nothing

    else if return1 then
        Just 1

    else
        inputList
            |> createSeriesList length []
            |> List.map List.product
            |> List.maximum



-- Create a list of all the consecutive numbers in the inputlist.


createSeriesList : Int -> List (List Int) -> List Int -> List (List Int)
createSeriesList length acc series =
    if List.isEmpty series then
        List.filter (\x -> List.length x == length) acc

    else
        createSeriesList
            length
            (List.take length series :: acc)
            (List.drop 1 series)
