module View exposing (view)

import Html.Styled exposing (Html, div)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Print exposing (viewPrint)
import View.Screen exposing (viewScreen)


view : Model -> Html Msg
view model =
    div
        []
        [ viewScreen
        , viewPrint
        ]
