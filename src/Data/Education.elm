module Data.Education exposing
    ( EducationData
    , initEducationData
    )


type alias EducationData =
    { name : String
    , specialization : String
    }


initEducationData : EducationData
initEducationData =
    { name = "University of Waterloo"
    , specialization = "Bachelor of Computer Science (Co-op, Graduated with Distinction)"
    }
