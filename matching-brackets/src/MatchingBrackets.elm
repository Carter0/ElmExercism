module MatchingBrackets exposing (isPaired)


isPaired : String -> Bool
isPaired input =
    case String.foldl stackFunctionality (Result.Ok []) input of
        Err error ->
            False

        Ok value ->
            List.isEmpty value

 {- 
 TLDR Andthen : if any of the updateStack function calls returns a Err, Err the whole thing.
 Long version: Use partial application to make a callback function that matches the function signature for andThen.
 Run the code with andthen, which first checks to see if Result is already an error, if it is, don't even
 bother running the callback function, just return the error.
 Otherwise run the callback function and return whatever that result happens to be.
 Result.andThen could already be taking in an error from a previous call, so it needs to check.
 -}
stackFunctionality : Char -> Result String (List Char) -> Result String (List Char) 
stackFunctionality bracket bracketStack =
    Result.andThen (updateStack bracket) bracketStack

updateStack : Char -> List Char -> Result String (List Char)
updateStack bracket bracketStack =
    if isStartingBrackets bracket then
        Result.Ok <| bracket :: bracketStack

    else if isEndingBrackets bracket then
        let
            popValue =
                List.head bracketStack
        in
        case popValue of
            Nothing ->
                Result.Err "Nothing to pop off in stack"

            Just a ->
                if bracketToLookFor a == bracket then
                    Result.Ok <| List.drop 1 bracketStack
                    -- Matching bracket, return the rest

                else
                    Result.Err "Brackets do not match"

    else
        Result.Ok bracketStack


isEndingBrackets : Char -> Bool
isEndingBrackets char =
    char == '}' || char == ']' || char == ')'


isStartingBrackets : Char -> Bool
isStartingBrackets char =
    char == '{' || char == '[' || char == '('


bracketToLookFor : Char -> Char
bracketToLookFor char =
    if char == '{' then
        '}'

    else if char == '(' then
        ')'

    else
        ']'
