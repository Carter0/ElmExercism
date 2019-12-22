module Triangle exposing (Triangle(..), triangleKind)


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : number -> number -> number -> Result String Triangle
triangleKind x y z =
    case errorChecking x y z of
        Err err ->
            Result.Err err

        Ok _ ->
            Result.Ok (triangleCheck x y z)


errorChecking : number -> number -> number -> Result String String
errorChecking x y z =
    if x <= 0 || y <= 0 || z <= 0 then
        Result.Err "Invalid lengths"

    else if not (x + y > z && x + z > y && y + z > x) then
        Result.Err "Violates inequality"

    else
        Result.Ok "Valid Triangle"


triangleCheck : number -> number -> number -> Triangle
triangleCheck x y z =
    let
        xEqualsY =
            x == y

        yEqualsZ =
            y == z

        zEqualsX =
            z == x
    in
    case ( xEqualsY, yEqualsZ, zEqualsX ) of
        ( True, True, True ) ->
            Equilateral

        ( False, False, False ) ->
            Scalene

        ( _, _, _ ) ->
            Isosceles
