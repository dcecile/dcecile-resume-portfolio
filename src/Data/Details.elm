module Data.Details
    exposing
        ( DetailsItemData
        , allDetailsItems
        )

import Data exposing (Data)
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


allDetailsItems : Data -> List DetailsItemData
allDetailsItems data =
    let
        convert =
            flip List.map
    in
    List.concat
        [ convert data.mindsets.items detailsItemData
        , convert data.tech.items detailsItemData
        , convert data.projects.items detailsItemDataWithUrl
        , convert data.work.portfolioItems detailsItemData
        ]


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
