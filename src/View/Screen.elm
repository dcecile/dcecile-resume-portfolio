module View.Screen
    exposing
        ( viewScreen
        )

import Css exposing (alignItems, display, fontSize, lineHeight, none, num, stretch)
import Css.Media exposing (only, screen, withMedia)
import CssShorthand exposing (displayFlexColumn)
import Html.Styled exposing (Html, div, styled)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Contents exposing (viewContents)
import View.Footer exposing (viewFooter)
import View.Frame exposing (viewFrame)
import View.Intro exposing (viewIntro)
import View.Links exposing (viewLinks)
import View.Metrics exposing (standardLineHeight, standardScreenFontSize)
import View.Mindsets exposing (viewMindsets)
import View.Section exposing (viewSection, viewSectionBlank)


viewScreen : Model -> Html Msg
viewScreen model =
    let
        style =
            [ display none
            , fontSize standardScreenFontSize
            , lineHeight <| num standardLineHeight
            , alignItems stretch
            , withMedia
                [ only screen [] ]
                [ displayFlexColumn ]
            ]
    in
    styled div
        style
        []
        [ viewFrame
        , viewIntro model
        , viewLinks model
        , viewContents model
        , viewMindsets model
        , viewSection model model.data.tech [ viewSectionBlank ]
        , viewSection model model.data.projects [ viewSectionBlank ]
        , viewSection model model.data.work [ viewSectionBlank ]
        , viewFooter
        ]
