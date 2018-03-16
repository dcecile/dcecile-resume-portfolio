module Update
    exposing
        ( update
        )

import ClickInfo exposing (ClickInfo)
import Model exposing (Animation(AnimationClose, AnimationOpen), Model)
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

        DetailsOpen name clickInfo ->
            change (open name clickInfo)

        DetailsClose ->
            change close

        NoMsg ->
            ( model, Cmd.none )


open : String -> ClickInfo -> Model -> Model
open name clickInfo model =
    { model
        | details =
            Just
                { name = name
                , animation = AnimationOpen
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
