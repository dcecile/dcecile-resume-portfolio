module View.ResumePreview exposing (viewResumePreview)

import Assets exposing (Assets)
import Css exposing (Em, alignItems, backgroundColor, borderBox, boxShadow5, boxSizing, center, em, flexEnd, flexStart, fontSize, height, hex, justifyContent, marginBottom, marginLeft, marginRight, marginTop, minHeight, px, vh, vw, width, zero)
import CssShorthand exposing (animation, displayFlexColumn, displayFlexRow, displayNone, marginRightLeft, mediaNotPrint, noStyle, paddingTopBottom, willChangeTransform)
import Data exposing (Data)
import Display exposing (Display)
import Html.Styled exposing (Html, a, div, styled, text)
import Html.Styled.Attributes exposing (download, href)
import HtmlShorthand exposing (HtmlTag, hrefHash, onClickPreventDefault)
import Icon exposing (IconBackground, IconSource, iconSpan)
import LazyHtml exposing (fromLazyHtml2, toLazyHtml)
import Msg exposing (Msg(..))
import View.Breakpoints exposing (breakpointResumePreviewLarge, breakpointResumePreviewMedium, breakpointResumePreviewMediumLarge)
import View.Button as Button
import View.Colors exposing (white)
import View.Metrics exposing (standardPrintFontSize, standardScreenFontSizeLarge, standardScreenFontSizeSmall)
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
            ]
    in
    styled div
        style
        []
        [ fromLazyHtml2 viewResumePreviewStatic assets data
        ]


viewResumePreviewStatic : Assets -> Data -> Html Msg
viewResumePreviewStatic assets data =
    let
        style =
            [ displayFlexColumn
            , alignItems center
            , breakpointResumePreviewLarge
                [ displayFlexRow
                , justifyContent center
                , alignItems flexStart
                ]
            , boxSizing borderBox
            , paddingTopBottom <| em 1.8
            , breakpointResumePreviewMedium
                [ paddingTopBottom <| em 2.5
                ]
            , breakpointResumePreviewLarge
                [ paddingTopBottom <| em 4
                ]
            , minHeight <| vh 100
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
            , alignItems center
            , breakpointResumePreviewMedium
                [ displayFlexRow
                , justifyContent center
                ]
            , breakpointResumePreviewLarge
                [ displayFlexColumn
                , justifyContent flexStart
                , alignItems flexEnd
                ]
            , fontSize standardScreenFontSizeSmall
            , breakpointResumePreviewLarge
                [ fontSize standardScreenFontSizeLarge
                ]
            , marginLeft <| em -1.5
            , marginBottom <| em 0.5
            , breakpointResumePreviewMediumLarge
                [ marginBottom zero
                ]
            , breakpointResumePreviewLarge
                [ marginTop <| em 1.8
                , marginRight <| em 2.2
                , marginLeft zero
                ]
            , animation <|
                String.join " "
                    [ "fromTop"
                    , "500ms"
                    , "ease-out"
                    ]
            , breakpointResumePreviewLarge
                [ animation <|
                    String.join " "
                        [ "fromLeft"
                        , "500ms"
                        , "ease-out"
                        ]
                ]
            ]
    in
    styled div
        style
        []
        [ viewAction iconSource
            .download
            [ href "%PUBLIC_URL%/resume.pdf"
            , download <| viewResumeName data
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
            , breakpointResumePreviewMedium
                [ displayFlexColumn
                ]
            , breakpointResumePreviewLarge
                [ displayFlexRow
                ]
            , alignItems center
            , marginLeft <| em 1.5
            , breakpointResumePreviewLarge
                [ marginLeft zero
                ]
            , marginBottom <| em 0.8
            , breakpointResumePreviewMedium
                [ marginBottom <| em 1.9
                ]
            , breakpointResumePreviewLarge
                [ marginBottom <| em 1.2
                ]
            ]

        iconStyle =
            [ marginLeft <| px -24
            , breakpointResumePreviewMediumLarge
                [ marginLeft zero
                ]
            ]
    in
    styled div
        style
        []
        [ iconSpan iconStyle iconSource iconBackground
        , viewButton attributes elements
        ]


viewButton : HtmlTag Msg
viewButton =
    styled a
        [ Button.border
        , Button.sizeMedium
        , breakpointResumePreviewMediumLarge
            [ Button.sizeLarge
            ]
        , Button.text
        , marginRightLeft <| em 0.7
        , breakpointResumePreviewMedium
            [ marginTop <| em 0.6
            , marginRightLeft zero
            ]
        , breakpointResumePreviewLarge
            [ marginTop zero
            , marginRight zero
            , marginLeft <| em 0.7
            ]
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
            , breakpointResumePreviewLarge
                [ marginRight <| em 1
                ]
            , width <| ptToEm pageWidthPt
            , height <| ptToEm pageHeightPt
            , backgroundColor white
            , fontSize <| vw (standardPrintFontSize.numericValue / (pageWidthPt + 1.5 * 72) * 100)
            , breakpointResumePreviewLarge
                [ fontSize <| em 1
                ]
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
