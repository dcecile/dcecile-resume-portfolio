module View exposing (view)

import Css exposing (center, color, textAlign)
import Css.Colors exposing (black)
import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (css)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Print exposing (viewPrint)
import View.Screen exposing (viewScreen)


view : Model -> Html Msg
view model =
    div
        [ css
            [ textAlign center
            , color black
            ]
        ]
        [ viewScreen
        , viewPrint
        ]
