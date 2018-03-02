module Data.Basic
    exposing
        ( BasicData
        , initBasicData
        )

import MarkedString exposing (MarkedString, markedString)


type alias BasicData =
    { name : String
    , emailAddress : String
    , homepageURL : String
    , portfolioTitle : String
    , resumeTagline : String
    , portfolioSellingPoint : MarkedString
    , portfolioPitch : String
    , sourceURL : String
    , sourceShortURL : Maybe String
    }


initBasicData : BasicData
initBasicData =
    { name = "Dan Cecile"
    , emailAddress = "dancecile@gmail.com"
    , homepageURL = "https://dcecile.github.io"
    , portfolioTitle = "Software developer generalist"
    , resumeTagline = "Software developer, 10 years experience"
    , portfolioSellingPoint = markedString "10 years of experience learning new `tech`, writing `code`, and improving `systems`."
    , portfolioPitch = "How can I help your team grow?"
    , sourceURL = "https://github.com/dcecile/dcecile-resume-portfolio"
    , sourceShortURL = Just "https://git.io/dcecile-resume"
    }
