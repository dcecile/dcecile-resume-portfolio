module View.Screen
    exposing
        ( viewScreen
        )

import Css exposing (block, display, none)
import Css.Media exposing (only, screen, withMedia)
import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (css)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Graphic exposing (viewGraphic)
import View.Intro exposing (viewIntro)


viewScreen : Model -> Html Msg
viewScreen model =
    div
        [ css
            [ display none
            , withMedia
                [ only screen [] ]
                [ display block ]
            ]
        ]
        [ viewIntro model
        , viewGraphic
        ]
