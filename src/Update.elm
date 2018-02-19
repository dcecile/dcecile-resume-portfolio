module Update
    exposing
        ( update
        )

import Model exposing (Model)
import Msg exposing (Msg(Print))
import Print exposing (print)


update : Msg -> Model -> ( Model, Cmd Msg )
update Print model =
    ( model, print () )
