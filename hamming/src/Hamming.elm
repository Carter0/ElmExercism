module Hamming exposing (distance)


distance : String -> String -> Result String Int
distance left right =
    if not (String.length left == String.length right) then
        Err "left and right strands must be of equal length"
    else 
        Ok (hamming left right)
    
hamming : String -> String -> Int
hamming left right =     
    List.map2 difference (String.toList left) (String.toList right)
        |> List.sum

difference : Char -> Char -> Int
difference left right =
    if left /= right then
        1
    else 
        0

    

