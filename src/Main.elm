module Main exposing (main)

import Flags exposing (Flags)
import Browser exposing (element)
import Html.Styled exposing (toUnstyled)
import Model exposing (Model)
import Msg exposing (Msg)
import Update exposing (update)
import View exposing (alsoViewHead, subscribe, view)


main : Program Flags Model Msg
main =
    element
        { init = Model.init >> alsoViewHead
        , update = (\( a, b ) -> update a b) >> alsoViewHead |> (\f a b -> f ( a, b ))
        , subscriptions = subscribe
        , view = view >> toUnstyled
        }
