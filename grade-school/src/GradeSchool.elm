module GradeSchool exposing (addStudent, allStudents, empty, studentsInGrade)

import Dict exposing (Dict)


type alias Grade =
    Int


type alias Student =
    String


type alias School =
    Dict Grade (List Student)


empty : School
empty =
    Dict.empty


{- 
The value at the key might not exist so you can’t write a v -> v function. 
You need to handle the case where the value is and is not there. 
So, add a student and sort the list if the value is there.
Make a new list with the student if nothing was at that key.
The maybe value return type gives you the ability to delete the value if you return Nothing.
-}
update : Student -> Maybe (List Student) -> Maybe (List Student)
update toAddStudent maybeStudent =
    case maybeStudent of
        Just student ->
             Just (List.sort (toAddStudent :: student))

        Nothing ->
            Just [toAddStudent]



addStudent : Grade -> Student -> School -> School
addStudent grade student school =
    Dict.update grade (update student) school
    


studentsInGrade : Grade -> School -> List Student
studentsInGrade grade school =
    case Dict.get grade school of 
        Nothing -> 
            []
        Just studentRoster ->
            studentRoster


allStudents : School -> List ( Grade, List Student )
allStudents school =
    Dict.toList school
