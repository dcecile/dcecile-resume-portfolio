module Data.Education
    exposing
        ( EducationData
        , initEducationData
        )


type alias EducationData =
    { location : String
    , period : String
    , name : String
    }


initEducationData : EducationData
initEducationData =
    { location = "University of Waterloo"
    , period = "2004–2009"
    , name = "Bachelor of Computer Science"
    }
