module Data.Basic
    exposing
        ( BasicData
        , initBasicData
        )


type alias BasicData =
    { name : String
    , emailAddress : String
    , sourceURL : String
    }


initBasicData : BasicData
initBasicData =
    { name = "Dan Cecile"
    , emailAddress = "dancecile@gmail.com"
    , sourceURL = "https://github.com/dcecile/dcecile-resume-portfolio"
    }
