module Update
    exposing
        ( update
        )

import ClickInfo exposing (ClickInfo)
import Data.Details exposing (DetailsItemData)
import Display.Details exposing (DetailsAnimation(DetailsAnimationClose, DetailsAnimationOpen))
import Model exposing (Model)
import Msg exposing (Msg(DetailsClose, DetailsOpen, NoMsg, Print))
import Print exposing (print)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        change transform =
            ( transform model, Cmd.none )
    in
    case msg of
        Print ->
            ( model, print () )

        DetailsOpen item clickInfo ->
            change (open item clickInfo)

        DetailsClose ->
            change close

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


close : Model -> Model
close model =
    { model
        | details =
            model.details
                |> Maybe.map (\details -> { details | animation = DetailsAnimationClose })
    }
