module Data.Basic
    exposing
        ( BasicData
        , homepageURL
        , initBasicData
        , sourceURL
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


homepageURL : String
homepageURL =
    "https://dcecile.github.io"


sourceURL : String
sourceURL =
    "https://github.com/dcecile/dcecile-resume-portfolio"


initBasicData : BasicData
initBasicData =
    { name = "Dan Cecile"
    , emailAddress = "dancecile@gmail.com"
    , currentLocation = "Kitchener, Ontario"
    , homepageURL = homepageURL
    , portfolioTagline = "Software developer"
    , resumeTagline = "Software developer, 10 years experience"
    , portfolioIntroPoints =
        [ markedString "It’s in the work I do."
        , markedString "I start with `listening` and `learning`, I look for improvements, and I get things done."
        , markedString "I’m ready for my next challenge."
        , markedString "How can I help your team `grow`?"
        ]
    , sourceURL = sourceURL
    , sourceShortURL = Just "https://git.io/dcecile-resume"
    }
