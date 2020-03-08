module ListOps exposing
    ( append
    , concat
    , filter
    , foldl
    , foldr
    , length
    , map
    , reverse
    )


length : List a -> Int
length list =
    lengthHelper list 0

lengthHelper : List a -> Int -> Int
lengthHelper list acc = 
    case list of 
        [] -> 
            acc

        _ :: xs -> 
            lengthHelper xs (acc + 1)



reverse : List a -> List a
reverse list =
    reverseHelper list []

reverseHelper : List a -> List a -> List a 
reverseHelper list acc = 
    case list of
        [] ->
            acc
            
        x :: xs ->
            reverseHelper xs (x :: acc)
    


foldl : (a -> b -> b) -> b -> List a -> b
foldl f acc list =
    case list of
        [] ->
            acc
    
        x :: xs ->
            foldl f (f x acc) xs
            
    


{--
The actual way to do foldr is kinda crazy, this is a fake, hacky way. 
Still it was good to see how foldr goes from the back of the list (the right), 
while foldl goes from the front of the list (the left).
--}
foldr : (a -> b -> b) -> b -> List a -> b
foldr f acc list =
    foldHelper f acc (reverse list)


foldHelper : (a -> b -> b) -> b -> List a -> b
foldHelper f acc list =
    case list of 
        [] ->
            acc
        
        x :: xs -> 
            foldHelper f (f x acc) xs 


map : (a -> b) -> List a -> List b
map f list =
    mapHelper f (reverse list) []

mapHelper : (a -> b) -> List a -> List b -> List b
mapHelper f list acc =
    case list of
        [] ->
            acc
    
        x::xs ->
            mapHelper f xs (f x :: acc)
    


filter : (a -> Bool) -> List a -> List a
filter f list =
    let
        foldrFunction x acc =     
            if f x then 
                x :: acc
            else 
                acc
    in
    foldr foldrFunction [] list


--filterHelper f (reverse list) [] to do it this way
{-
filterHelper : (a -> Bool) -> List a -> List a -> List a
filterHelper f list acc = 
    case list of
        [] ->
            acc
    
        x::xs ->
            if f x then
                filterHelper f xs (x::acc)
            else 
                filterHelper f xs acc
-}
            
append : List a -> List a -> List a
append xs ys =
    case ys of
        [] ->
            xs

        _ ->
            foldr (::) ys xs

{--
Get's kinda crazy walking through this and seeing how it really is just appending all
the sublists together into one lists with a foldr.
--}
concat : List (List a) -> List a
concat list =
    foldr append [] list
