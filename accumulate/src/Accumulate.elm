module Accumulate exposing (accumulate)


accumulate : (a -> b) -> List a -> List b
accumulate func input =
    List.reverse (map func input [])


map : (a -> b) -> List a -> List b -> List b
map func input acc =
    case input of
        [] ->
            acc

        first :: rest ->
            map func rest (func first :: acc)
