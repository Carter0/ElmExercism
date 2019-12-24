module Anagram exposing (detect)


detect : String -> List String -> List String
detect word candidates =
    List.filterMap (isAnagramOf word) candidates


isAnagramOf : String -> String -> Maybe String
isAnagramOf word candidate =
    if String.toLower word == String.toLower candidate then
        Nothing

    else if changeString word == changeString candidate then
        Just candidate

    else
        Nothing


changeString : String -> List Char
changeString word =
    word
        |> String.toLower
        |> String.toList
        |> List.sort
