module Update
    exposing
        ( update
        )

import ClickInfo exposing (ClickInfo)
import Model exposing (Animation(AnimationClose, AnimationOpen), Model)
import Msg exposing (Msg(DetailsClose, DetailsOpen, Print))
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

        DetailsOpen clickInfo ->
            change (open clickInfo)

        DetailsClose ->
            change close


open : ClickInfo -> Model -> Model
open clickInfo model =
    { model
        | details =
            Just
                { animation = AnimationOpen
                , clickInfo = clickInfo
                }
    }


close : Model -> Model
close model =
    { model
        | details =
            model.details
                |> Maybe.map (\details -> { details | animation = AnimationClose })
    }
