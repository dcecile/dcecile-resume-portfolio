module Data.Basic
    exposing
        ( BasicData
        , homepageURL
        , initBasicData
        , sourceURL
        )


type alias BasicData =
    { name : String
    , emailAddress : String
    , currentLocation : String
    , homepageURL : String
    , portfolioTagline : String
    , resumeTagline : String
    , portfolioIntroPoints : List String
    , sourceURL : String
    , sourceShortURL : Maybe String
    , about : String
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
        [ "It’s in the work I do."
        , "I start with listening and learning, I look for improvements, and I get things done."
        , "I’m ready for my next challenge."
        , "How can I help your team grow?"
        ]
    , sourceURL = sourceURL
    , sourceShortURL = Just "https://git.io/dcecile-resume"
    , about = "I live in Kitchener, Ontario, where I love to take walks even in the Canadian winter. I’m a lifelong student of Japanese, Chinese, and t’ai chi ch’üan. The most magical place for me is a library stacked with awesome books."
    }
