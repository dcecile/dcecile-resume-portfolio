module Data.Basic
    exposing
        ( BasicData
        , initBasicData
        )


type alias BasicData =
    { name : String
    , emailAddress : String
    , homepageURL : String
    , resumeTagline : String
    , sourceURL : String
    , sourceShortURL : Maybe String
    }


initBasicData : BasicData
initBasicData =
    { name = "Dan Cecile"
    , emailAddress = "dancecile@gmail.com"
    , homepageURL = "https://dcecile.github.io"
    , resumeTagline = "Software developer, 10 years experience"
    , sourceURL = "https://github.com/dcecile/dcecile-resume-portfolio"
    , sourceShortURL = Just "https://git.io/dcecile-resume"
    }
