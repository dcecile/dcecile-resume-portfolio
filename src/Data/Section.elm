module Data.Section
    exposing
        ( SectionData
        )

import Icon exposing (IconBackground)


type alias SectionData =
    { id : String
    , name : String
    , iconBackground : IconBackground
    }
