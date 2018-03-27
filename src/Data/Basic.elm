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
    , portfolioTagline = "~ Software developer ~"
    , resumeTagline = "Software developer, 10 years experience"
    , portfolioIntroPoints =
        [ markedString "Every code change I make starts with `listening` and `learning`."
        , markedString "I get things `done`, I seek out `improvements`, and I’m ready for my next challenge."
        , markedString "Are you looking to grow your team?"
        ]
    , sourceURL = "https://github.com/dcecile/dcecile-resume-portfolio"
    , sourceShortURL = Just "https://git.io/dcecile-resume"
    }
