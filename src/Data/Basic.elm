module Data.Basic
    exposing
        ( BasicData
        , initBasicData
        )

import MarkedString exposing (MarkedString, markedString)


type alias BasicData =
    { name : String
    , emailAddress : String
    , currentLocation : String
    , homepageURL : String
    , portfolioTagline : String
    , resumeTagline : String
    , portfolioIntroPoints : List MarkedString
    , sourceURL : String
    , sourceShortURL : Maybe String
    }


initBasicData : BasicData
initBasicData =
    { name = "Dan Cecile"
    , emailAddress = "dancecile@gmail.com"
    , currentLocation = "Kitchener, Ontario"
    , homepageURL = "https://dcecile.github.io"
    , portfolioTagline = "Software developer"
    , resumeTagline = "Software developer, 10 years experience"
    , portfolioIntroPoints =
        [ markedString "It’s in the work I do."
        , markedString "I start with `listening` and `learning`, I look for improvements, and I get things done."
        , markedString "I’m ready for my next challenge."
        , markedString "How can I help your team `grow`?"
        ]
    , sourceURL = "https://github.com/dcecile/dcecile-resume-portfolio"
    , sourceShortURL = Just "https://git.io/dcecile-resume"
    }
