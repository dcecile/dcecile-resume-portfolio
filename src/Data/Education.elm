module Data.Education exposing
    ( EducationData
    , initEducationData
    )


type alias EducationData =
    { name : String
    , period : String
    , specialization : String
    }


initEducationData : EducationData
initEducationData =
    { name = "University of Waterloo"
    , period = "2004–2009"
    , specialization = "Bachelor of Computer Science"
    }
