module PhoneNumber exposing (getNumber)

-- Callbacks, a way to make sure certain functions have not executed until after another function has.
-- A way of testing for nothing.
-- Basically, if phoneNumberCleaning returns nothing, it returns nothing
-- Otherwise, pipe the value into the badconditions callback and return whatever that does.


getNumber : String -> Maybe String
getNumber phoneNumber =
    phoneNumberCleaning phoneNumber
        |> Maybe.andThen badConditions


phoneNumberCleaning : String -> Maybe String
phoneNumberCleaning phoneNumber =
    let
        returnNumber =
            String.filter Char.isDigit phoneNumber
    in
    if String.startsWith "1" returnNumber && String.length returnNumber == 11 then
        Just (String.dropLeft 1 returnNumber)

    else if String.length returnNumber == 10 then
        Just returnNumber

    else
        Nothing


badConditions : String -> Maybe String
badConditions phoneNumber =
    let
        fourth =
            String.left 4 phoneNumber
    in
    if
        String.startsWith "0" phoneNumber
            || String.startsWith "1" phoneNumber
            || String.endsWith "0" fourth
            || String.endsWith "1" fourth
    then
        Nothing

    else
        Just phoneNumber
