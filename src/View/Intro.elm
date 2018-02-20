module View.Intro
    exposing
        ( viewIntro
        )

import Css exposing (alignItems, bold, center, color, em, fontSize, fontStyle, fontWeight, height, hex, italic, justifyContent, lineHeight, normal, num, opacity, px, vh, width)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, marginRightLeft, paddingRightLeft)
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
            , height (vh 80)
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
            [ fontWeight normal
            , fontSize <| em 2.2
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
            [ fontWeight normal
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
    p
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
            [ fontWeight bold ]
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
            , justifyContent center
            , alignItems center
            ]
    in
    styled div
        style
        []
        [ viewCallToActionIcon model mailBackground
        , viewCallToActionButton
            [ href "mailto:dancecile@gmail.com?subject=Hi"
            , targetBlank
            ]
            [ text "Send me an email" ]
        , viewCallToActionButton
            [ hrefHash
            , onClickPreventDefault Print
            ]
            [ text "Print my resume" ]
        , viewCallToActionIcon model printerBackground
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
            , marginRightLeft <| px 2
            , opacity <| num 0.8
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
            [ marginRightLeft <| px 14
            , paddingRightLeft <| em 0.8
            , lineHeight <| em 2.2
            , Button.border
            , Button.text
            ]
    in
    styled a style
