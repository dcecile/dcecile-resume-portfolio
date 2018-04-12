module View.Portfolio
    exposing
        ( viewPortfolio
        )

import Css exposing (alignItems, center, color, display, fontSize, lineHeight, none, num, stretch, textAlign)
import CssShorthand exposing (displayFlexColumn, mediaNotPrint, willChangeTransform)
import Html.Styled exposing (Html, div, styled)
import Model exposing (Model)
import Msg exposing (Msg)
import View.About exposing (viewAbout)
import View.Colors exposing (black)
import View.Contents exposing (viewContents)
import View.DetailsAnimation exposing (animatePortfolio)
import View.Footer exposing (viewFooter)
import View.Frame exposing (viewFrame)
import View.Intro exposing (viewIntro)
import View.Links exposing (viewLinks)
import View.Metrics exposing (standardLineHeight, standardScreenFontSize)
import View.Mindsets exposing (viewMindsets)
import View.Projects exposing (viewProjects)
import View.Tech exposing (viewTech)
import View.Work exposing (viewWork)


viewPortfolio : Model -> Html Msg
viewPortfolio model =
    let
        style =
            [ display none
            , fontSize standardScreenFontSize
            , lineHeight <| num standardLineHeight
            , alignItems stretch
            , textAlign center
            , color black
            , willChangeTransform
            , mediaNotPrint [ displayFlexColumn ]
            , animatePortfolio model
            ]
    in
    styled div
        style
        []
        [ viewFrame
        , viewIntro model
        , viewLinks model
        , viewAbout model
        , viewContents model
        , viewWork model
        , viewMindsets model
        , viewTech model
        , viewProjects model
        , viewFooter model
        ]
