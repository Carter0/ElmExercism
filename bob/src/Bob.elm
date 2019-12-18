module Bob exposing (hey)


hey : String -> String
hey remark =
    let
        realRemark =
            String.trimRight remark

        isNotEmpty =
            not (String.isEmpty realRemark)

        isQuestion =
            String.endsWith "?" realRemark

        containsCharacterCaps =
            (not <| String.any Char.isLower realRemark) && String.any Char.isAlpha realRemark
    in
    if isNotEmpty then
        case ( isQuestion, containsCharacterCaps ) of
            ( True, True ) ->
                "Calm down, I know what I'm doing!"

            ( True, False ) ->
                "Sure."

            ( False, True ) ->
                -- (1, 2, 3) is all caps who woulda figured.
                "Whoa, chill out!"

            ( False, False ) ->
                "Whatever."
    else
        "Fine. Be that way!"
