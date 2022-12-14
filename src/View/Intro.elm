module View.Intro exposing (viewIntro)

import Assets exposing (Assets)
import Css exposing (alignItems, alignSelf, bold, center, color, em, fontSize, fontWeight, left, lineHeight, marginBottom, marginTop, maxWidth, normal, num, position, relative, textAlign, zero)
import CssShorthand exposing (displayFlexColumn, marginTopBottom, paddingRightLeft)
import Data exposing (Data)
import Html.Styled exposing (Html, div, h1, header, main_, p, span, styled, text)
import Msg exposing (Msg)
import View.CallsToAction exposing (viewCallsToAction)
import View.Colors exposing (gray, green)
import View.Frame exposing (viewFrame)


viewIntro : Assets -> Data -> Html Msg
viewIntro assets data =
    let
        style =
            [ position relative
            , displayFlexColumn
            , alignItems center
            ]
    in
    styled div
        style
        []
        [ viewFrame
        , viewIntroContent assets data
        ]


viewIntroContent : Assets -> Data -> Html Msg
viewIntroContent assets data =
    let
        basicData =
            data.basic

        style =
            [ position relative
            , displayFlexColumn
            , maxWidth <| em 35
            , paddingRightLeft <| em 2
            ]
    in
    styled div
        style
        []
        [ viewHeader
            basicData.name
            basicData.pronouns
            basicData.tagline
        , viewMain assets data
        ]


viewHeader : String -> String -> String -> Html Msg
viewHeader name pronouns tagline =
    let
        style =
            [ displayFlexColumn
            , textAlign left
            , marginTop <| em 2.2
            , marginBottom <| em 1.2
            ]
    in
    styled header
        style
        []
        [ viewName name pronouns
        , viewTagline tagline
        ]


viewName : String -> String -> Html Msg
viewName name pronouns =
    let
        style =
            [ marginTopBottom zero
            , fontWeight bold
            , fontSize <| em 2.2
            , lineHeight <| num 1.4
            ]

        pronounsStyle =
            [ color gray
            , fontWeight normal
            , fontSize <| em 0.7
            ]
    in
    styled h1
        style
        []
        [ text name
        , text " "
        , styled span
            pronounsStyle
            []
            [ text pronouns
            ]
        ]


viewTagline : String -> Html Msg
viewTagline tagline =
    let
        style =
            [ marginTopBottom zero
            , color green
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
            , maxWidth <| em 35
            ]
    in
    List.concat
        [ basicData.portfolioIntroPoints
            |> List.map viewPoint
        , viewCallsToAction assets data
            |> List.singleton
        ]
        |> styled main_ style []


viewPoint : String -> Html Msg
viewPoint introPoint =
    let
        style =
            [ alignSelf center
            , textAlign left
            , marginTop zero
            , marginBottom <| em 0.8
            , fontSize <| em 0.85
            ]
    in
    styled p
        style
        []
        [ text introPoint ]
