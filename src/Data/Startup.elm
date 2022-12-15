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
        , "bias to action"
        , "continuous improvement"
        , "customer success"
        , "learning on-the-fly"
        , "nondualism"
        , "ownership"
        , "product thinking"
        , "shipping"
        , "tenacity"
        ]
    , portfolioOutro = Nothing
    }
