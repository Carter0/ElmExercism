module Leap exposing (isLeapYear)


isLeapYear : Int -> Bool
isLeapYear year =
    let
        divByNum num =
            remainderBy num year == 0
    in
    case ( divByNum 4, divByNum 100, divByNum 400 ) of
        ( True, True, True ) ->
            True

        ( True, True, False ) ->
            False

        ( True, _, _ ) ->
            True

        ( False, _, _ ) ->
            False
