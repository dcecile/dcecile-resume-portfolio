module View.Intro
    exposing
        ( viewIntro
        )

import Css exposing (alignSelf, bold, calc, center, color, em, firstOfType, fontSize, fontStyle, fontWeight, italic, justifyContent, lastOfType, lineHeight, marginBottom, marginTop, maxWidth, minHeight, minus, normal, nthOfType, num, vh, zero)
import CssShorthand exposing (afterText, beforeText, displayFlexColumn)
import Html.Styled exposing (Html, div, h1, header, main_, p, styled, text)
import Model exposing (Model)
import Msg exposing (Msg)
import View.CallsToAction exposing (viewCallsToAction)
import View.Colors exposing (paleGreen)
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
            basicData.portfolioTagline
        , viewMain model
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
            [ marginTop zero
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


viewMain : Model -> Html Msg
viewMain model =
    let
        basicData =
            model.data.basic

        style =
            [ displayFlexColumn
            ]
    in
    List.concat
        [ basicData.portfolioIntroPoints
            |> List.map viewPoint
        , viewCallsToAction [] model
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
