module Acronym exposing (abbreviate)


abbreviate : String -> String
abbreviate phrase =
    let
        words =
            phrase
                |> String.replace "-" " "
                |> String.split " "
    in
    List.foldr addChar "" words


addChar : String -> String -> String
addChar word acr =
    let
        firstChar =
            word
                |> String.left 1
                |> String.toUpper
    in
    String.append firstChar acr
