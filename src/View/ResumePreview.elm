module View.ResumePreview
    exposing
        ( viewResumePreview
        )

import Assets exposing (Assets)
import Css exposing (Em, alignItems, backgroundColor, boxShadow5, center, em, flexEnd, flexStart, fontSize, height, hex, justifyContent, marginBottom, marginLeft, marginRight, marginTop, minHeight, px, vh, width, zero)
import CssShorthand exposing (animation, displayFlexColumn, displayFlexRow, displayNone, mediaNotPrint, noStyle, paddingTopBottom, willChangeTransform)
import Data exposing (Data)
import Display exposing (Display)
import Html.Styled exposing (Html, a, div, styled, text)
import Html.Styled.Attributes exposing (downloadAs, href)
import HtmlShorthand exposing (HtmlTag, hrefHash, onClickPreventDefault)
import Icon exposing (IconBackground, IconSource, iconSpan)
import LazyHtml exposing (LazyHtml, fromLazyHtml2, toLazyHtml)
import Msg exposing (Msg(Print))
import View.Button as Button
import View.Colors exposing (white)
import View.Metrics exposing (standardPrintFontSize, standardScreenFontSizeSmall)
import View.Resume exposing (viewResume, viewResumeName)


pageWidthPt : Float
pageWidthPt =
    8.5 * 72


pageHeightPt : Float
pageHeightPt =
    11 * 72


ptToEm : Float -> Em
ptToEm length =
    em <| length / standardPrintFontSize.numericValue


viewResumePreview : Assets -> Data -> Display -> Html Msg
viewResumePreview assets data display =
    let
        style =
            [ willChangeTransform
            , displayNone
            , if display.showResumePreview then
                mediaNotPrint [ displayFlexColumn ]
              else
                noStyle
            , minHeight <| vh 100
            ]
    in
    styled div
        style
        []
        [ fromLazyHtml2 viewResumePreviewStatic assets data
        ]


viewResumePreviewStatic : Assets -> Data -> LazyHtml Msg
viewResumePreviewStatic assets data =
    let
        style =
            [ displayFlexRow
            , justifyContent center
            , alignItems flexStart
            , paddingTopBottom <| em 4
            , backgroundColor <| hex "#dadada"
            ]
    in
    styled div
        style
        []
        [ viewActions assets data
        , viewPage assets data
        ]
        |> toLazyHtml


viewActions : Assets -> Data -> Html Msg
viewActions assets data =
    let
        iconSource =
            assets.iconSource

        style =
            [ displayFlexColumn
            , alignItems flexEnd
            , fontSize standardScreenFontSizeSmall
            , marginTop <| em 1.8
            , marginRight <| em 2.2
            , animation <|
                String.join " "
                    [ "fromLeft"
                    , "500ms"
                    , "ease-out"
                    ]
            ]
    in
    styled div
        style
        []
        [ viewAction iconSource
            .download
            [ href "%PUBLIC_URL%/resume.pdf"
            , downloadAs <| viewResumeName data
            ]
            [ text "Download my resume"
            ]
        , viewAction iconSource
            .printer
            [ hrefHash
            , onClickPreventDefault (always Print)
            ]
            [ text "Print my resume"
            ]
        , viewAction iconSource
            .home
            [ href "#top" ]
            [ text "View my portfolio"
            ]
        ]


viewAction : IconSource -> IconBackground -> HtmlTag Msg
viewAction iconSource iconBackground attributes elements =
    let
        style =
            [ displayFlexRow
            , alignItems center
            , marginBottom <| em 1.2
            ]
    in
    styled div
        style
        []
        [ iconSpan [] iconSource iconBackground
        , viewButton attributes elements
        ]


viewButton : HtmlTag Msg
viewButton =
    styled a
        [ Button.border
        , Button.sizeLarge
        , Button.text
        , marginLeft <| em 0.7
        , backgroundColor white
        ]


viewPage : Assets -> Data -> Html Msg
viewPage assets data =
    let
        style =
            [ displayFlexColumn
            , boxShadow5
                (px 2)
                (px 2)
                (px 14)
                zero
                (hex "#313131")
            , width <| ptToEm pageWidthPt
            , height <| ptToEm pageHeightPt
            , backgroundColor white
            , animation <|
                String.join " "
                    [ "fadeIn"
                    , "200ms"
                    , "ease-in"
                    ]
            ]
    in
    styled div
        style
        []
        [ viewResume assets data ]