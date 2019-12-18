module Pangram exposing (isPangram)

import Set

isPangram : String -> Bool
isPangram sentence =
    let
        alphabetLength =
            26
    in
    sentence
        |> String.filter Char.isAlpha
        |> String.toLower
        |> String.toList
        |> Set.fromList
        |> Set.size
        |> (==) alphabetLength



