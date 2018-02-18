module Main exposing (main)

import Html exposing (programWithFlags)
import Html.Styled exposing (toUnstyled)
import Model exposing (Flags, Model)
import Msg exposing (Msg)
import Update exposing (update)
import View exposing (view)


main : Program Flags Model Msg
main =
    programWithFlags
        { init = Model.init
        , update = update
        , subscriptions = always Sub.none
        , view = view >> toUnstyled
        }
