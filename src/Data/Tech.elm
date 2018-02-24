module Data.Tech
    exposing
        ( TechData
        , initTechData
        )

import Data.Section exposing (SectionData)
import Icon exposing (boxBackground)


type alias TechData =
    SectionData {}


initTechData : TechData
initTechData =
    { id = "tech"
    , name = "Tech fluency"
    , iconBackground = boxBackground
    }
