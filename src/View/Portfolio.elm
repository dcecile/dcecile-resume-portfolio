module View.Portfolio
    exposing
        ( viewPortfolio
        )

import Assets exposing (Assets)
import Css exposing (alignItems, center, color, fontSize, lineHeight, num, stretch, textAlign)
import CssShorthand exposing (displayFlexColumn, displayNone, mediaNotPrint, willChangeTransform)
import Data exposing (Data)
import Display exposing (Display)
import Html.Styled exposing (Html, div, styled)
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


viewPortfolio : Assets -> Data -> Display -> Html Msg
viewPortfolio assets data display =
    let
        style =
            [ displayNone
            , fontSize standardScreenFontSize
            , lineHeight <| num standardLineHeight
            , alignItems stretch
            , textAlign center
            , color black
            , willChangeTransform
            , mediaNotPrint [ displayFlexColumn ]
            , animatePortfolio display
            ]
    in
    styled div
        style
        []
        [ viewFrame
        , viewIntro assets data
        , viewLinks assets data
        , viewAbout data
        , viewContents assets data
        , viewWork assets data
        , viewMindsets assets data
        , viewTech assets data
        , viewProjects assets data
        , viewFooter assets data
        ]
