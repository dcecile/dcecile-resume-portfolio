module View.Screen
    exposing
        ( viewScreen
        )

import Css exposing (display, none)
import Css.Media exposing (only, screen, withMedia)
import CssShorthand exposing (displayFlexColumn)
import Html.Styled exposing (Html, div, styled)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Graphic exposing (viewGraphic)
import View.Intro exposing (viewIntro)
import View.Links exposing (viewLinks)


viewScreen : Model -> Html Msg
viewScreen model =
    let
        style =
            [ display none
            , withMedia
                [ only screen [] ]
                [ displayFlexColumn ]
            ]
    in
    styled div
        style
        []
        [ viewIntro model
        , viewLinks model
        , viewGraphic
        ]
