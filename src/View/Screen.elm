module View.Screen exposing (viewScreen)

import Css exposing (block, display, none)
import Css.Media exposing (only, screen, withMedia)
import Html.Styled exposing (Html, div)
import Html.Styled.Attributes exposing (css)
import Msg exposing (Msg)
import View.Graphic exposing (viewGraphic)
import View.Intro exposing (viewIntro)


viewScreen : Html Msg
viewScreen =
    div
        [ css
            [ display none
            , withMedia
                [ only screen [] ]
                [ display block ]
            ]
        ]
        [ viewIntro
        , viewGraphic
        ]
