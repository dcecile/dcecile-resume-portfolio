module View.Contents
    exposing
        ( viewContents
        )

import Css exposing (alignItems, bold, boxShadow5, center, em, fontSize, fontWeight, justifyContent, lineHeight, marginBottom, marginTop, minWidth, num, px, zero)
import CssShorthand exposing (borderRightLeftWidth, borderSolidColor, borderTopBottomWidth, displayFlexColumn, displayFlexRow, displayFlexRowReverse, marginRightLeft, marginTopBottom, paddingRightLeft, paddingTopBottom)
import Html.Styled exposing (Html, a, div, h2, nav, span, styled, text)
import Html.Styled.Attributes exposing (href, id)
import Icon exposing (IconBackground, boxBackground, calendarBackground, eyeBackground, heartBackground, iconSpan)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Button as Button
import View.Colors exposing (black, paleGreen)
import View.Metrics exposing (standardBorderWidth)


viewContents : Model -> Html Msg
viewContents model =
    let
        style =
            [ displayFlexColumn
            , borderSolidColor black
            , borderTopBottomWidth standardBorderWidth
            , borderRightLeftWidth zero
            , boxShadow5
                zero
                zero
                zero
                (px 1)
                paleGreen
            , paddingTopBottom <| em 2.0
            , marginBottom <| em 3.0
            ]
    in
    styled nav
        style
        [ id "contents" ]
        [ viewHeader
        , viewLinks model
        ]


viewHeader : Html Msg
viewHeader =
    let
        style =
            [ fontWeight bold
            , fontSize <| em 1.2
            , marginTop zero
            , marginBottom <| em 0.5
            ]
    in
    styled h2
        style
        []
        [ text "Portfolio contents" ]


viewLinks : Model -> Html Msg
viewLinks model =
    let
        style =
            [ displayFlexRow
            , justifyContent center
            , marginBottom <| px 12
            ]
    in
    styled div
        style
        []
        [ viewLinksColumn
            [ viewLink model False "mindsets" "Mindsets" eyeBackground
            , viewLink model False "tech-fluency" "Tech fluency" boxBackground
            ]
        , viewLinksColumn
            [ viewLink model True "side-projects" "Side projects" heartBackground
            , viewLink model True "work-history" "Work history" calendarBackground
            ]
        ]


viewLinksColumn : List (Html Msg) -> Html Msg
viewLinksColumn =
    let
        style =
            [ displayFlexColumn
            ]
    in
    styled div style []


viewLink : Model -> Bool -> String -> String -> IconBackground -> Html Msg
viewLink model reverse fragmentID linkText iconBackground =
    let
        style =
            [ if reverse then
                displayFlexRowReverse
              else
                displayFlexRow
            , alignItems center
            ]
    in
    styled span
        style
        []
        [ viewLinkIcon model iconBackground
        , viewLinkButton fragmentID linkText
        ]


viewLinkIcon : Model -> IconBackground -> Html Msg
viewLinkIcon =
    .iconSource >> iconSpan zero


viewLinkButton : String -> String -> Html Msg
viewLinkButton fragmentID linkText =
    let
        style =
            [ Button.border
            , Button.text
            , marginTopBottom <| px 10
            , marginRightLeft <| px 18
            , paddingRightLeft <| em 0.8
            , minWidth <| em 6.2
            , lineHeight <| num 2.1
            ]
    in
    styled a
        style
        [ href <| "#" ++ fragmentID
        ]
        [ text linkText
        ]
