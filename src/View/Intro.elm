module View.Intro
    exposing
        ( viewIntro
        )

import Css exposing (Style, alignItems, alignSelf, bold, center, color, em, flexBasis, flexEnd, flexGrow, flexStart, fontSize, fontStyle, fontWeight, height, hex, italic, justifyContent, lineHeight, marginBottom, marginTop, maxWidth, normal, num, opacity, px, stretch, vh, width, zero)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, displayFlexRowReverse, marginRightLeft, paddingRightLeft)
import Html.Styled exposing (Html, a, div, h1, h2, p, span, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (HtmlTag, hrefHash, onClickPreventDefault, targetBlank)
import Icon exposing (IconBackground, mailBackground, printerBackground)
import Model exposing (Model)
import Msg exposing (Msg(Print))
import View.Button as Button


viewIntro : Model -> Html Msg
viewIntro model =
    let
        style =
            [ displayFlexColumn
            , justifyContent center
            , alignItems center
            , height (vh 85)
            ]
    in
    styled div
        style
        []
        [ viewName
        , viewTitle
        , viewSellingPoint
        , viewPitch
        , viewCallsToAction model
        ]


viewName : Html Msg
viewName =
    let
        style =
            [ marginTop zero
            , marginBottom zero
            , fontWeight normal
            , fontSize <| em 2.2
            , lineHeight <| num 1.4
            ]
    in
    styled h1
        style
        []
        [ text "Dan Cecile" ]


viewTitle : Html Msg
viewTitle =
    let
        style =
            [ marginTop zero
            , marginBottom <| em 1.4
            , fontWeight normal
            , fontSize <| em 1
            , fontStyle italic
            ]
    in
    styled h2
        style
        []
        [ text "Software developer generalist" ]


viewSellingPoint : Html Msg
viewSellingPoint =
    let
        style =
            [ marginTop zero
            , marginBottom <| em 1.8
            , maxWidth <| em 22
            ]

        highlightStyle =
            [ color <| hex "#00a934"
            ]

        normal =
            text

        highlight =
            text
                >> List.singleton
                >> styled span highlightStyle []
    in
    styled p
        style
        []
        [ normal "10 years of experience learning new "
        , highlight "tech"
        , normal ", writing "
        , highlight "code"
        , normal ", and improving "
        , highlight "systems"
        , normal "."
        ]


viewPitch : Html Msg
viewPitch =
    let
        style =
            [ marginTop zero
            , marginBottom <| em 1.2
            , fontWeight bold
            ]
    in
    styled p
        style
        []
        [ text "How can I help your team grow?" ]


viewCallsToAction : Model -> Html Msg
viewCallsToAction model =
    let
        style =
            [ displayFlexRow
            , justifyContent stretch
            , alignSelf stretch
            ]
    in
    styled div
        style
        []
        [ viewCallToAction model
            displayFlexRow
            mailBackground
            [ href "mailto:dancecile@gmail.com?subject=Hi"
            , targetBlank
            ]
            [ text "Send me an email" ]
        , viewCallToAction model
            displayFlexRowReverse
            printerBackground
            [ hrefHash
            , onClickPreventDefault Print
            ]
            [ text "Print my resume" ]
        ]


viewCallToAction : Model -> Style -> IconBackground -> HtmlTag Msg
viewCallToAction model displayStyle iconBackground attributes elements =
    let
        style =
            [ displayStyle
            , justifyContent flexEnd
            , alignItems center
            , flexBasis <| em 0
            , flexGrow <| num 1
            ]
    in
    styled div
        style
        []
        [ viewCallToActionIcon model iconBackground
        , viewCallToActionButton attributes elements
        ]


viewCallToActionIcon : Model -> IconBackground -> Html Msg
viewCallToActionIcon model iconBackground =
    let
        iconSize =
            px 24

        style =
            [ iconBackground model.iconSource
            , width iconSize
            , height iconSize
            , marginRightLeft <| px 8
            , opacity <| num 0.93
            ]
    in
    styled span
        style
        []
        []


viewCallToActionButton : HtmlTag Msg
viewCallToActionButton =
    let
        style =
            [ marginRightLeft <| px 18
            , paddingRightLeft <| em 1.1
            , lineHeight <| num 2.4
            , Button.border
            , Button.text
            ]
    in
    styled a style
