module View.Contents
    exposing
        ( viewContents
        )

import Css exposing (alignItems, bold, borderWidth, boxShadow5, center, em, fontSize, fontWeight, justifyContent, lineHeight, marginBottom, marginTop, minWidth, num, px, zero)
import CssShorthand exposing (borderTopBottomSolidColor, displayFlexColumn, displayFlexRow, displayFlexRowReverse, marginRightLeft, marginTopBottom, paddingRightLeft, paddingTopBottom)
import Data exposing (Data)
import Data.Section exposing (SectionData)
import Html.Styled exposing (Html, a, div, h2, nav, span, styled, text)
import Html.Styled.Attributes exposing (href, id)
import Icon exposing (IconBackground, IconSource, iconSpan)
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
            , borderTopBottomSolidColor black
            , borderWidth standardBorderWidth
            , boxShadow5
                zero
                zero
                zero
                (px 1)
                paleGreen
            , paddingTopBottom <| em 2.0
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
            [ viewLink model False .work
            , viewLink model False .mindsets
            ]
        , viewLinksColumn
            [ viewLink model True .tech
            , viewLink model True .projects
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


viewLink : Model -> Bool -> (Data -> SectionData a) -> Html Msg
viewLink model reverse sectionDataSelector =
    let
        sectionData =
            sectionDataSelector model.data

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
        [ viewLinkIcon model.iconSource sectionData.portfolioIconBackground
        , viewLinkButton sectionData.id sectionData.name
        ]


viewLinkIcon : IconSource -> IconBackground -> Html Msg
viewLinkIcon =
    iconSpan []


viewLinkButton : String -> String -> Html Msg
viewLinkButton fragmentID linkText =
    let
        style =
            [ Button.border
            , Button.sizeMedium
            , Button.text
            , marginTopBottom <| px 10
            , marginRightLeft <| px 18
            , minWidth <| em 6.2
            ]
    in
    styled a
        style
        [ href <| "#" ++ fragmentID ]
        [ text linkText ]
