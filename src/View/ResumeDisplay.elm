module View.ResumeDisplay
    exposing
        ( viewResumeDisplay
        )

import Css exposing (Em, Vw, alignItems, alignSelf, backgroundColor, boxShadow5, center, display, em, flexEnd, flexGrow, flexStart, fontSize, height, hex, hidden, justifyContent, marginBottom, marginLeft, marginRight, marginTop, minHeight, none, num, overflow, px, vh, vw, width, zero)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom, mediaNotPrint, paddingRightLeft, paddingTopBottom, willChangeTransform)
import Html.Styled exposing (Html, a, div, styled, text)
import Html.Styled.Attributes exposing (downloadAs, href)
import HtmlShorthand exposing (HtmlTag, hrefHash, onClickPreventDefault)
import Icon exposing (IconBackground, IconSource, iconSpan)
import Model exposing (Model)
import Msg exposing (Msg(Print))
import View.Button as Button
import View.Colors exposing (white)
import View.Metrics exposing (standardPrintFontSize, standardScreenFontSize)
import View.Resume exposing (viewResume)


pageWidthPt : Float
pageWidthPt =
    8.5 * 72


pageHeightPt : Float
pageHeightPt =
    11 * 72


ptToEm : Float -> Em
ptToEm length =
    em <| length / standardPrintFontSize.numericValue


viewResumeDisplay : Model -> Html Msg
viewResumeDisplay model =
    let
        style =
            [ willChangeTransform
            , display none
            , justifyContent center
            , alignItems flexStart
            , paddingTopBottom <| em 4
            , minHeight <| vh 100
            , backgroundColor <| hex "#dadada"
            , mediaNotPrint [ displayFlexRow ]
            ]
    in
    styled div
        style
        []
        [ viewButtons model.iconSource
        , viewPage model
        ]


viewButtons : IconSource -> Html Msg
viewButtons iconSource =
    let
        style =
            [ displayFlexColumn
            , alignItems flexEnd
            , fontSize standardScreenFontSize
            , marginTop <| em 1.8
            , marginRight <| em 2.2
            ]
    in
    styled div
        style
        []
        [ viewAction iconSource
            .download
            [ href "%PUBLIC_URL%/resume.pdf"
            , downloadAs "Dan Cecile’s resume"
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


viewPage : Model -> Html Msg
viewPage model =
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
            , backgroundColor <| hex "#ffffff"
            ]
    in
    styled div
        style
        []
        [ viewResume model ]
