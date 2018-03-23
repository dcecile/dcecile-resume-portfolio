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
    , previousName : Maybe String
    , nextName : Maybe String
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
        convert items transform =
            List.map3
                transform
                items
                ([ Nothing ] ++ List.map Just items)
                (List.drop 1 (List.map Just items) ++ [ Nothing ])
    in
    List.concat
        [ convert data.mindsets.items <|
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
        , convert data.work.portfolioItems <|
            getDetails
                (always Nothing)
                False
        ]


getDetails :
    (DetailsItemDataInput a
     -> Maybe (DetailsItemDataInputUrl b)
    )
    -> Bool
    -> DetailsItemDataInput a
    -> Maybe (DetailsItemDataInput a)
    -> Maybe (DetailsItemDataInput a)
    -> DetailsItemData
getDetails itemUrlSelector capitalizeName item previousItem nextItem =
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
    , previousName = Maybe.map .name previousItem
    , nextName = Maybe.map .name nextItem
    }
