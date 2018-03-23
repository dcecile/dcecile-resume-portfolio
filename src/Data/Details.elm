module Data.Details
    exposing
        ( DetailsItemData
        , allDetailsItems
        )

import Data exposing (Data)
import MarkedString exposing (MarkedString)


type alias DetailsItemData =
    { name : String
    , capitalizeName : Bool
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
        convert items details capitalizeName =
            List.map (details capitalizeName) items
    in
    List.concat
        [ convert data.mindsets.items detailsItemData True
        , convert data.tech.items detailsItemData True
        , convert data.projects.items detailsItemDataWithUrl False
        , convert data.work.portfolioItems detailsItemData False
        ]


detailsItemData : Bool -> DetailsItemDataInput a -> DetailsItemData
detailsItemData =
    detailsItemDataMaybeWithUrl (always Nothing)


detailsItemDataWithUrl : Bool -> DetailsItemDataInput (DetailsItemDataInputUrl a) -> DetailsItemData
detailsItemDataWithUrl =
    detailsItemDataMaybeWithUrl Just


detailsItemDataMaybeWithUrl : (DetailsItemDataInput a -> Maybe (DetailsItemDataInputUrl b)) -> Bool -> DetailsItemDataInput a -> DetailsItemData
detailsItemDataMaybeWithUrl itemUrlSelector capitalizeName item =
    let
        itemUrlPart part =
            Maybe.andThen part (itemUrlSelector item)
    in
    { name = item.name
    , capitalizeName = capitalizeName
    , homepageUrl = itemUrlPart .homepageUrl
    , sourceUrl = itemUrlPart .sourceUrl
    , intro = item.detailsIntro
    , points = item.detailsPoints
    }
