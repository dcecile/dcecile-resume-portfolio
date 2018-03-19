module Data.Details
    exposing
        ( DetailsItemData
        , DetailsItemDataInput
        , DetailsItemDataInputUrl
        , detailsItemData
        )

import MarkedString exposing (MarkedString)


type alias DetailsItemData =
    { name : String
    , homepageUrl : Maybe String
    , sourceUrl : Maybe String
    , intro : String
    , points : List MarkedString
    }


type alias DetailsItemDataInput a =
    { a
        | name : String
        , detailsIntro : String
        , detailsPoints : List MarkedString
    }


type alias DetailsItemDataInputUrl a =
    { a
        | homepageUrl : Maybe String
        , sourceUrl : Maybe String
    }


detailsItemData : DetailsItemDataInput a -> Maybe (DetailsItemDataInputUrl b) -> DetailsItemData
detailsItemData item itemUrl =
    { name = item.name
    , homepageUrl = Maybe.andThen .homepageUrl itemUrl
    , sourceUrl = Maybe.andThen .sourceUrl itemUrl
    , intro = item.detailsIntro
    , points = item.detailsPoints
    }
