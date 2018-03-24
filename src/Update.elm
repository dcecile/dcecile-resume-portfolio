module Update
    exposing
        ( findDetailsItem
        , update
        )

import ClickInfo exposing (ClickInfo)
import Data.Details exposing (DetailsItemData)
import Display.Details exposing (DetailsAnimation(DetailsAnimationClose, DetailsAnimationOpen), DetailsDisplay)
import ListEx
import Model exposing (Model)
import Msg exposing (Msg(DetailsClose, DetailsNavigate, DetailsOpen, NoMsg, Print))
import Print exposing (print)


type alias Update =
    ( Model, Cmd Msg )


update : Msg -> Model -> Update
update msg =
    case msg of
        Print ->
            sendCommand <|
                print ()

        DetailsOpen name clickInfo ->
            updateModel <|
                maybeModel <|
                    maybeSetDetails <|
                        maybeWithDetailsItem name <|
                            open clickInfo

        DetailsNavigate name ->
            updateModel <|
                maybeModel <|
                    maybeUpdateDetails <|
                        \details ->
                            maybeWithDetailsItem name <|
                                navigate details

        DetailsClose ->
            updateModel <|
                maybeModel <|
                    maybeUpdateDetails <|
                        close

        NoMsg ->
            updateModel <|
                identity


sendCommand : Cmd Msg -> Model -> Update
sendCommand command model =
    ( model, command )


updateModel : (Model -> Model) -> Model -> Update
updateModel transform model =
    ( transform model, Cmd.none )


maybeModel : (Model -> Maybe Model) -> Model -> Model
maybeModel transform model =
    transform model
        |> Maybe.withDefault model


maybeSetDetails : (Model -> Maybe DetailsDisplay) -> Model -> Maybe Model
maybeSetDetails transform model =
    transform model
        |> Maybe.map (\details -> { model | details = Just details })


maybeUpdateDetails : (DetailsDisplay -> Model -> Maybe DetailsDisplay) -> Model -> Maybe Model
maybeUpdateDetails transform =
    maybeSetDetails
        (\model -> model.details |> Maybe.andThen (\details -> transform details model))


maybeWithDetailsItem : String -> (DetailsItemData -> a) -> Model -> Maybe a
maybeWithDetailsItem name transform model =
    findDetailsItem name model.allDetailsItems
        |> Maybe.map transform


findDetailsItem : String -> List DetailsItemData -> Maybe DetailsItemData
findDetailsItem name =
    ListEx.find (\item -> item.name == name)


open : ClickInfo -> DetailsItemData -> DetailsDisplay
open clickInfo item =
    { itemData = item
    , animation = DetailsAnimationOpen
    , openClickInfo = clickInfo
    }


navigate : DetailsDisplay -> DetailsItemData -> DetailsDisplay
navigate details item =
    { details
        | itemData = item
    }


close : DetailsDisplay -> Model -> Maybe DetailsDisplay
close details _ =
    Just
        { details
            | animation = DetailsAnimationClose
        }
