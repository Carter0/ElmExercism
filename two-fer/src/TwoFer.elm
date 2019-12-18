module TwoFer exposing (twoFer)


twoFer : Maybe String -> String
twoFer name =
    let 
        realname = Maybe.withDefault "you" name
    in
    "One for " ++ realname ++ ", one for me."


