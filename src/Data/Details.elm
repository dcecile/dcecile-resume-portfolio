module Data.Details
    exposing
        ( DetailsItemData
        , DetailsItemDataInput
        , DetailsItemDataInputUrl
        , detailsItemData
        , detailsItemDataWithUrl
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


detailsItemData : DetailsItemDataInput a -> DetailsItemData
detailsItemData =
    detailsItemDataMaybeWithUrl (always Nothing)


detailsItemDataWithUrl : DetailsItemDataInput (DetailsItemDataInputUrl a) -> DetailsItemData
detailsItemDataWithUrl =
    detailsItemDataMaybeWithUrl Just


detailsItemDataMaybeWithUrl : (DetailsItemDataInput a -> Maybe (DetailsItemDataInputUrl b)) -> DetailsItemDataInput a -> DetailsItemData
detailsItemDataMaybeWithUrl itemUrlSelector item =
    let
        itemUrlPart part =
            Maybe.andThen part (itemUrlSelector item)
    in
    { name = item.name
    , homepageUrl = itemUrlPart .homepageUrl
    , sourceUrl = itemUrlPart .sourceUrl
    , intro = item.detailsIntro
    , points = item.detailsPoints
    }
