module View.Intro
    exposing
        ( viewIntro
        )

import Assets exposing (Assets)
import Css exposing (alignSelf, bold, calc, center, color, em, firstOfType, fontSize, fontStyle, fontWeight, italic, justifyContent, lastOfType, lineHeight, marginBottom, marginTop, maxWidth, minHeight, minus, normal, nthOfType, num, vh, zero)
import CssShorthand exposing (afterText, beforeText, displayFlexColumn, marginRightLeft)
import Data exposing (Data)
import Html.Styled exposing (Html, div, h1, header, main_, p, styled, text)
import Msg exposing (Msg)
import View.CallsToAction exposing (viewCallsToAction)
import View.Colors exposing (paleGreen)
import View.Links exposing (linksCutoff)


viewIntro : Assets -> Data -> Html Msg
viewIntro assets data =
    let
        basicData =
            data.basic

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
            basicData.portfolioTagline
        , viewMain assets data
        ]


viewHeader : String -> String -> Html Msg
viewHeader name tagline =
    let
        style =
            [ displayFlexColumn
            ]
    in
    styled header
        style
        []
        [ viewName name
        , viewTagline tagline
        ]


viewName : String -> Html Msg
viewName name =
    let
        style =
            [ marginTop <| em 0.7
            , marginBottom zero
            , fontWeight bold
            , fontSize <| em 2.2
            , lineHeight <| num 1.4
            ]
    in
    styled h1
        style
        []
        [ text name ]


viewTagline : String -> Html Msg
viewTagline tagline =
    let
        decorationStyle =
            [ color paleGreen
            ]

        style =
            [ marginTop zero
            , marginBottom <| em 1.4
            , fontStyle italic
            , beforeText "— " decorationStyle
            , afterText " —" decorationStyle
            ]
    in
    styled p
        style
        []
        [ text tagline ]


viewMain : Assets -> Data -> Html Msg
viewMain assets data =
    let
        basicData =
            data.basic

        style =
            [ displayFlexColumn
            ]

        callsToActionStyle =
            [ marginBottom <| em 2
            ]
    in
    List.concat
        [ basicData.portfolioIntroPoints
            |> List.map viewPoint
        , viewCallsToAction callsToActionStyle assets data
            |> List.singleton
        ]
        |> styled main_ style []


viewPoint : String -> Html Msg
viewPoint introPoint =
    let
        style =
            [ alignSelf center
            , marginTop zero
            , marginBottom <| em 0.6
            , marginRightLeft <| em 1
            , maxWidth <| em 20
            , nthOfType "2n + 1" [ fontStyle italic ]
            , firstOfType [ fontStyle normal, fontWeight bold ]
            , lastOfType [ fontStyle normal, fontWeight bold ]
            ]
    in
    styled p
        style
        []
        [ text introPoint ]
