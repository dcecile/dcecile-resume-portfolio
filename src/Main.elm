module Main exposing (main)

import Html exposing (program)
import Html.Styled exposing (toUnstyled)
import Model exposing (Model)
import Msg exposing (Msg)
import Update exposing (update)
import View exposing (view)


main : Program Never Model Msg
main =
    program
        { view = view >> toUnstyled
        , init = Model.init
        , update = update
        , subscriptions = always Sub.none
        }
