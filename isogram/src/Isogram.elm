module Isogram exposing (isIsogram)


isIsogram : String -> Bool
isIsogram sentence =
    sentence
        |> String.toLower
        |> String.replace "-" ""
        |> String.replace " " ""
        |> String.toList
        |> isogramHelper ' '

isogramHelper : Char -> List Char -> Bool
isogramHelper char sentence =
    case sentence of
        [] ->
            True

        x :: xs ->
            if List.member x xs then
                False

            else
                isogramHelper x xs
