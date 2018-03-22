module Update
    exposing
        ( update
        )

import ClickInfo exposing (ClickInfo)
import Data.Details exposing (DetailsItemData, DetailsItemDataInput, detailsItemData, detailsItemDataWithUrl)
import Display.Details exposing (DetailsAnimation(DetailsAnimationClose, DetailsAnimationOpen), DetailsDisplay)
import ListEx
import Model exposing (Model)
import Msg exposing (Msg(DetailsClose, DetailsNavLink, DetailsOpen, NoMsg, Print))
import Print exposing (print)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        change : (Model -> Model) -> ( Model, Cmd Msg )
        change transform =
            ( transform model, Cmd.none )

        maybeChange : (Model -> Maybe Model) -> ( Model, Cmd Msg )
        maybeChange transform =
            change (transform >> Maybe.withDefault model)

        maybeChangeDetails : (Model -> DetailsDisplay -> Maybe DetailsDisplay) -> ( Model, Cmd Msg )
        maybeChangeDetails transform =
            maybeChange
                (\model ->
                    model.details
                        |> Maybe.andThen (transform model)
                        |> Maybe.map (\details -> { model | details = Just details })
                )
    in
    case msg of
        Print ->
            ( model, print () )

        DetailsOpen item clickInfo ->
            change (open item clickInfo)

        DetailsNavLink name ->
            maybeChangeDetails (navLink name)

        DetailsClose ->
            maybeChangeDetails close

        NoMsg ->
            ( model, Cmd.none )


open : DetailsItemData -> ClickInfo -> Model -> Model
open item clickInfo model =
    { model
        | details =
            Just
                { itemData = item
                , animation = DetailsAnimationOpen
                , openClickInfo = clickInfo
                }
    }


navLink : String -> Model -> DetailsDisplay -> Maybe DetailsDisplay
navLink name model details =
    findDetailsItem name model
        |> Maybe.map (\item -> { details | itemData = item })


findDetailsItem : String -> Model -> Maybe DetailsItemData
findDetailsItem name model =
    let
        data =
            model.data

        locations =
            [ findDetailsItemIn data.tech.items detailsItemData
            , findDetailsItemIn data.projects.items detailsItemDataWithUrl
            , findDetailsItemIn data.work.portfolioLargeItems detailsItemData
            , findDetailsItemIn data.work.portfolioSmallItems detailsItemData
            ]
    in
    ListEx.findMap (\location -> location name) locations


findDetailsItemIn : List (DetailsItemDataInput a) -> (DetailsItemDataInput a -> DetailsItemData) -> String -> Maybe DetailsItemData
findDetailsItemIn items detailsConverter name =
    items
        |> ListEx.find (\item -> item.name == name)
        |> Maybe.map detailsConverter


close : Model -> DetailsDisplay -> Maybe DetailsDisplay
close model details =
    Just { details | animation = DetailsAnimationClose }
