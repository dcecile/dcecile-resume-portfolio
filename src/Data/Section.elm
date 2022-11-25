module Data.Section exposing (SectionData)

import Icon exposing (IconBackground)


type alias SectionData a =
    { a
        | id : String
        , name : String
        , portfolioIconBackground : IconBackground
        , detailsNoun : String
        , portfolioIntro : String
        , portfolioOutro : Maybe String
    }
