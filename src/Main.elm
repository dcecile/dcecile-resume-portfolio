module Main exposing (main)

import Browser exposing (element)
import Data exposing (initData)
import Flags exposing (Flags)
import Html.Styled exposing (toUnstyled)
import Model exposing (Model)
import Msg exposing (Msg)
import Update exposing (update)
import View exposing (alsoViewHead, subscribe, view)


main : Program Flags Model Msg
main =
    let
        data =
            initData
    in
    element
        { init = Model.init data >> alsoViewHead data
        , update = (\( a, b ) -> update a b) >> alsoViewHead data |> (\f a b -> f ( a, b ))
        , subscriptions = subscribe
        , view = view data >> toUnstyled
        }
