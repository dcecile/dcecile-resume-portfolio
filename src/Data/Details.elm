module Data.Details
    exposing
        ( DetailsItemData
        , DetailsItemDataInput
        , detailsItemData
        )

import MarkedString exposing (MarkedString)


type alias DetailsItemData =
    { name : String
    , intro : String
    , points : List MarkedString
    }


type alias DetailsItemDataInput a =
    { a
        | name : String
        , detailsIntro : String
        , detailsPoints : List MarkedString
    }


detailsItemData : DetailsItemDataInput a -> DetailsItemData
detailsItemData item =
    { name = item.name
    , intro = item.detailsIntro
    , points = item.detailsPoints
    }
