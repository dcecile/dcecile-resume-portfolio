module Update exposing
    ( findDetailsItem
    , update
    )

import ClickInfo exposing (ClickInfo)
import Data.Details exposing (DetailsItemData)
import Display.Details exposing (DetailsAnimation(..), DetailsDisplay, DetailsNavigateDirection, initDoubleBuffer, swapDoubleBuffer)
import ListEx
import Model exposing (Model)
import Msg exposing (Msg(..))
import Print exposing (print)


type alias Update =
    ( Model, Cmd Msg )


update : Msg -> Model -> Update
update msg =
    case msg of
        HashChange hash ->
            updateModel <|
                maybeModel <|
                    hashChange hash

        Print ->
            sendCommand <|
                print ()

        DetailsOpen name clickInfo ->
            updateModel <|
                maybeModel <|
                    maybeSetDetails <|
                        maybeWithDetailsItem name <|
                            open clickInfo

        DetailsNavigate direction name ->
            updateModel <|
                maybeModel <|
                    maybeUpdateDetails <|
                        \details ->
                            maybeWithDetailsItem name <|
                                navigate details direction

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
    let
        setDisplay details =
            let
                display =
                    model.display
            in
            { display
                | details = Just details
            }

        setModel details =
            { model
                | display = setDisplay details
            }
    in
    transform model
        |> Maybe.map setModel


maybeUpdateDetails : (DetailsDisplay -> Model -> Maybe DetailsDisplay) -> Model -> Maybe Model
maybeUpdateDetails transform =
    maybeSetDetails
        (\model -> model.display.details |> Maybe.andThen (\details -> transform details model))


maybeWithDetailsItem : String -> (DetailsItemData -> a) -> Model -> Maybe a
maybeWithDetailsItem name transform model =
    findDetailsItem name model.display.detailsItems
        |> Maybe.map transform


findDetailsItem : String -> List DetailsItemData -> Maybe DetailsItemData
findDetailsItem name =
    ListEx.find (\item -> item.name == name)


hashChange : String -> Model -> Maybe Model
hashChange hash model =
    let
        newShowResumePreview =
            hash == "resume"

        setDisplay =
            let
                display =
                    model.display
            in
            { display
                | showResumePreview = newShowResumePreview
                , details = Nothing
            }

        setModel =
            { model
                | display = setDisplay
            }
    in
    if newShowResumePreview /= model.display.showResumePreview then
        Just setModel

    else
        Nothing


open : ClickInfo -> DetailsItemData -> DetailsDisplay
open clickInfo item =
    { itemData = item
    , animation = DetailsAnimationOpen
    , openClickInfo = clickInfo
    , doubleBufferState = initDoubleBuffer
    }


navigate : DetailsDisplay -> DetailsNavigateDirection -> DetailsItemData -> DetailsDisplay
navigate details direction item =
    { details
        | itemData = item
        , animation = DetailsAnimationNavigate { direction = direction, oldItemData = details.itemData }
        , doubleBufferState = swapDoubleBuffer details
    }


close : DetailsDisplay -> Model -> Maybe DetailsDisplay
close details _ =
    Just
        { details
            | animation = DetailsAnimationClose
        }
