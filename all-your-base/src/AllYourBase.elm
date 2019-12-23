module AllYourBase exposing (rebase)


rebase : Int -> List Int -> Int -> Maybe (List Int)
rebase inBase digits outBase =
    if badConditions inBase digits outBase == True then
        Nothing

    else
        Just (base10Conversion (List.length digits - 1) inBase digits 0 |> outBaseConversion outBase [])


badConditions : Int -> List Int -> Int -> Bool
badConditions inBase digits outBase =
    List.isEmpty (List.filter (\x -> x /= 0) digits)
        || inBase
        <= 1
        || outBase
        <= 1
        || List.any (\x -> x < 0) digits
        || List.any (\x -> x >= inBase) digits


base10Conversion : Int -> Int -> List Int -> Int -> Int
base10Conversion position base digits sum =
    case digits of
        [] ->
            sum

        x :: xs ->
            base10Conversion (position - 1) base xs (sum + (x * base ^ position))


outBaseConversion : Int -> List Int -> Int -> List Int
outBaseConversion outBase acc number =
    if number == 0 then
        acc

    else
        outBaseConversion outBase (modBy outBase number :: acc) (number // outBase)
