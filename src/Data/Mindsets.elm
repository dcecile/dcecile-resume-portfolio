module Data.Mindsets
    exposing
        ( MindsetsData
        , initMindsetsData
        )

import Data.Section exposing (SectionData)
import Icon exposing (eyeBackground)


type alias MindsetsData =
    SectionData


initMindsetsData : MindsetsData
initMindsetsData =
    { id = "mindsets"
    , name = "Mindsets"
    , iconBackground = eyeBackground
    }
