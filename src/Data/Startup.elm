module Data.Startup exposing
    ( StartupData
    , initStartupData
    )

import Data.Section exposing (SectionData)
import Data.Visibility exposing (ResumeVariant(..))


type alias StartupData =
    SectionData
        { items : List String
        }


initStartupData : StartupData
initStartupData =
    { id = "startup"
    , name = "Startup skills"
    , portfolioIconBackground = .box
    , detailsNoun = "skill"
    , portfolioIntro =
        "TODO"
    , items =
        [ "active listening"
        , "async"
        , "bias to action"
        , "continuous improvement"
        , "curiosity"
        , "customer success"
        , "learning on-the-fly"
        , "mentoring"
        , "nondualism"
        , "ownership"
        , "product thinking"
        , "shipping"
        , "tenacity"
        ]
    , portfolioOutro = Nothing
    }
