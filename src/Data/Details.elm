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
    , homepageURL : Maybe String
    , sourceURL : Maybe String
    , intro : MarkedString
    , points : List MarkedString
    , previousName : Maybe String
    , nextName : Maybe String
    }


type alias DetailsItemDataInput a =
    { a
        | name : String
        , detailsIntro : MarkedString
        , detailsPoints : List MarkedString
    }


type alias DetailsItemDataInputURL a =
    { a
        | homepageURL : Maybe String
        , sourceURL : Maybe String
    }


allDetailsItems : Data -> List DetailsItemData
allDetailsItems data =
    let
        convert items transform =
            List.map3
                transform
                items
                ([ Nothing ] ++ List.map Just items)
                (List.drop 1 (List.map Just items) ++ [ Nothing ])
    in
    List.concat
        [ convert data.work.portfolioItems <|
            getDetails
                (always Nothing)
                False
        , convert data.mindsets.items <|
            getDetails
                (always Nothing)
                True
        , convert data.tech.items <|
            getDetails
                (always Nothing)
                True
        , convert data.projects.items <|
            getDetails
                Just
                False
        ]


getDetails :
    (DetailsItemDataInput a
     -> Maybe (DetailsItemDataInputURL b)
    )
    -> Bool
    -> DetailsItemDataInput a
    -> Maybe (DetailsItemDataInput a)
    -> Maybe (DetailsItemDataInput a)
    -> DetailsItemData
getDetails itemURLSelector capitalizeName item previousItem nextItem =
    let
        itemURLPart part =
            Maybe.andThen part (itemURLSelector item)
    in
    { name = item.name
    , capitalizeName = capitalizeName
    , homepageURL = itemURLPart .homepageURL
    , sourceURL = itemURLPart .sourceURL
    , intro = item.detailsIntro
    , points = item.detailsPoints
    , previousName = Maybe.map .name previousItem
    , nextName = Maybe.map .name nextItem
    }
