module View.Intro
    exposing
        ( viewIntro
        )

import Css exposing (Style, alignItems, alignSelf, bold, calc, center, color, em, flexBasis, flexEnd, flexGrow, flexStart, fontSize, fontStyle, fontWeight, height, italic, justifyContent, lineHeight, marginBottom, marginTop, maxWidth, minHeight, minus, normal, num, opacity, px, stretch, vh, width, zero)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, displayFlexRowReverse, marginRightLeft, paddingRightLeft)
import Html.Styled exposing (Html, a, div, h1, header, main_, p, span, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (HtmlTag, hrefHash, onClickPreventDefault, styledSpanText, targetBlank)
import Icon exposing (IconBackground, IconSource, iconSpan)
import MarkedString exposing (MarkedString)
import Model exposing (Model)
import Msg exposing (Msg(Print))
import View.Button as Button
import View.Colors exposing (blackLevel, green)
import View.Links exposing (linksCutoff)


viewIntro : Model -> Html Msg
viewIntro model =
    let
        basicData =
            model.data.basic

        style =
            [ displayFlexColumn
            , justifyContent center
            , minHeight <| calc (vh 100) minus linksCutoff
            ]
    in
    styled div
        style
        []
        [ viewHeader
            basicData.name
            basicData.portfolioTitle
        , viewMain model
        ]


viewHeader : String -> String -> Html Msg
viewHeader name title =
    let
        style =
            [ displayFlexColumn
            ]
    in
    styled header
        style
        []
        [ viewName name
        , viewTitle title
        ]


viewName : String -> Html Msg
viewName name =
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
        [ text name ]


viewTitle : String -> Html Msg
viewTitle title =
    let
        style =
            [ marginTop zero
            , marginBottom <| em 1.4
            , fontStyle italic
            ]
    in
    styled p
        style
        []
        [ text title ]


viewMain : Model -> Html Msg
viewMain model =
    let
        basicData =
            model.data.basic

        style =
            [ displayFlexColumn
            ]
    in
    styled main_
        style
        []
        [ viewSellingPoint
            basicData.portfolioSellingPoint
        , viewPitch
            basicData.portfolioPitch
        , viewCallsToAction
            model.iconSource
            basicData.emailAddress
        ]


viewSellingPoint : MarkedString -> Html Msg
viewSellingPoint sellingPoint =
    let
        style =
            [ alignSelf center
            , marginTop zero
            , marginBottom <| em 1.8
            , maxWidth <| em 22
            ]

        highlight =
            styledSpanText [ color green ]
    in
    sellingPoint
        |> MarkedString.transform text highlight
        |> styled p style []


viewPitch : String -> Html Msg
viewPitch pitch =
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
        [ text pitch ]


viewCallsToAction : IconSource -> String -> Html Msg
viewCallsToAction iconSource emailAddress =
    let
        style =
            [ displayFlexRow
            , justifyContent stretch
            ]
    in
    styled div
        style
        []
        [ viewCallToAction iconSource
            displayFlexRow
            .mail
            [ href <| "mailto:" ++ emailAddress ++ "?subject=Hi"
            , targetBlank
            ]
            [ text "Send me an email" ]
        , viewCallToAction iconSource
            displayFlexRowReverse
            .printer
            [ hrefHash
            , onClickPreventDefault (always Print)
            ]
            [ text "Print my resume" ]
        ]


viewCallToAction : IconSource -> Style -> IconBackground -> HtmlTag Msg
viewCallToAction iconSource displayStyle iconBackground attributes elements =
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
        [ viewCallToActionIcon iconSource iconBackground
        , viewCallToActionButton attributes elements
        ]


viewCallToActionIcon : IconSource -> IconBackground -> Html Msg
viewCallToActionIcon =
    iconSpan (px 8)


viewCallToActionButton : HtmlTag Msg
viewCallToActionButton =
    let
        style =
            [ Button.border
            , Button.sizeLarge
            , Button.text
            , marginRightLeft <| px 18
            ]
    in
    styled a style
