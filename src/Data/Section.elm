module Data.Section
    exposing
        ( SectionData
        )

import Icon exposing (IconBackground)


type alias SectionData a =
    { a
        | id : String
        , name : String
        , iconBackground : IconBackground
    }
