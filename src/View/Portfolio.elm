module View.Portfolio
    exposing
        ( viewPortfolio
        )

import Css exposing (alignItems, display, fontSize, lineHeight, none, num, stretch)
import Css.Media exposing (print, withMedia)
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
import View.Tech exposing (viewTech)


viewPortfolio : Model -> Html Msg
viewPortfolio model =
    let
        style =
            [ display none
            , fontSize standardScreenFontSize
            , lineHeight <| num standardLineHeight
            , alignItems stretch
            , withMedia
                [ Css.Media.not print [] ]
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
        , viewTech model
        , viewSection model.iconSource model.data.projects [ viewSectionBlank ]
        , viewSection model.iconSource model.data.work [ viewSectionBlank ]
        , viewFooter
        ]
