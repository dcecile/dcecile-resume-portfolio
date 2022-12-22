module View.Portfolio exposing (viewPortfolio)

import Assets exposing (Assets)
import Css exposing (alignItems, center, color, fontSize, lineHeight, num, stretch, textAlign)
import CssShorthand exposing (displayFlexColumn, displayNone, mediaNotPrint, noStyle, willChangeTransform)
import Data exposing (Data)
import Display exposing (Display)
import Html.Styled exposing (Html, div, styled)
import LazyHtml exposing (LazyHtml, fromLazyHtml2, toLazyHtml)
import Msg exposing (Msg)
import View.Breakpoints exposing (breakpointPortfolioMedium)
import View.Colors exposing (black)
import View.Contents exposing (viewContents)
import View.DetailsAnimation exposing (animatePortfolio)
import View.Footer exposing (viewFooter)
import View.Intro exposing (viewIntro)
import View.Metrics exposing (standardLineHeight, standardScreenFontSizeLarge, standardScreenFontSizeSmall)
import View.Mindsets exposing (viewMindsets)
import View.Projects exposing (viewProjects)
import View.Tech exposing (viewTech)
import View.Work exposing (viewWork)


viewPortfolio : Assets -> Data -> Display -> Html Msg
viewPortfolio assets data display =
    let
        style =
            [ willChangeTransform
            , displayNone
            , if display.showResumePreview then
                noStyle

              else
                mediaNotPrint
                    [ displayFlexColumn
                    ]
            , animatePortfolio display
            ]
    in
    styled div
        style
        []
        [ fromLazyHtml2 viewPortfolioStatic assets data
        ]


viewPortfolioStatic : Assets -> Data -> LazyHtml Msg
viewPortfolioStatic assets data =
    let
        style =
            [ displayFlexColumn
            , fontSize standardScreenFontSizeSmall
            , breakpointPortfolioMedium
                [ fontSize standardScreenFontSizeLarge
                ]
            , lineHeight <| num standardLineHeight
            , alignItems stretch
            , textAlign center
            , color black
            ]
    in
    styled div
        style
        []
        [ viewIntro assets data
        , viewContents assets data
        , viewWork assets data
        , viewMindsets assets data
        , viewTech assets data
        , viewProjects assets data
        , viewFooter assets data
        ]
        |> toLazyHtml
