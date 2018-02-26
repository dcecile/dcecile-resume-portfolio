module Data.Mindsets
    exposing
        ( MindsetsData
        , initMindsetsData
        )

import Data.Section exposing (SectionData)
import Icon exposing (eyeBackground)


type alias MindsetsData =
    SectionData
        { items : List String
        }


initMindsetsData : MindsetsData
initMindsetsData =
    { id = "mindsets"
    , name = "Mindsets"
    , iconBackground = eyeBackground
    , intro =
        "From my toolbox of paradigms and perspectives, these are my most strongly-developed mindsets:"
    , items =
        [ "Learning"
        , "Teaching"
        , "Analyzing"
        , "Coordinating"
        , "Improving"
        ]
    , outro = Nothing
    }
