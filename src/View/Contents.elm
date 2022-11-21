module View.Contents exposing (viewContents)

import Assets exposing (Assets)
import Css exposing (alignItems, bold, borderWidth, boxShadow5, center, em, fontSize, fontWeight, justifyContent, lineHeight, marginBottom, marginRight, marginTop, minWidth, num, paddingBottom, paddingTop, px, zero)
import CssShorthand exposing (borderTopBottomSolidColor, displayFlexColumn, displayFlexRow, displayFlexRowReverse, marginRightLeft, marginTopBottom, paddingRightLeft)
import Data exposing (Data)
import Data.Section exposing (SectionData)
import Html.Styled exposing (Html, a, div, h2, nav, span, styled, text)
import Html.Styled.Attributes exposing (href, id)
import Icon exposing (IconBackground, IconSource, iconSpan)
import Msg exposing (Msg)
import View.Breakpoints exposing (breakpointPortfolioMedium)
import View.Button as Button
import View.Colors exposing (black, paleGreen)
import View.Metrics exposing (standardBorderWidth)


viewContents : Assets -> Data -> Html Msg
viewContents assets data =
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
            , paddingTop <| em 1.3
            , paddingBottom <| em 1.0
            , breakpointPortfolioMedium
                [ paddingTop <| em 1.8
                , paddingBottom <| em 1.5
                ]
            ]
    in
    styled nav
        style
        [ id "contents" ]
        [ viewHeader
        , viewLinks assets data
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


viewLinks : Assets -> Data -> Html Msg
viewLinks assets data =
    let
        style =
            [ displayFlexColumn
            , breakpointPortfolioMedium
                [ displayFlexRow
                ]
            , justifyContent center
            , marginBottom <| px 12
            ]
    in
    styled div
        style
        []
        [ viewLinksColumn
            [ viewLink assets data False .work
            , viewLink assets data False .mindsets
            ]
        , viewLinksColumn
            [ viewLink assets data True .tech
            , viewLink assets data True .projects
            ]
        ]


viewLinksColumn : List (Html Msg) -> Html Msg
viewLinksColumn =
    let
        style =
            [ displayFlexColumn
            , alignItems center
            ]
    in
    styled div style []


viewLink : Assets -> Data -> Bool -> (Data -> SectionData a) -> Html Msg
viewLink assets data reverse sectionDataSelector =
    let
        sectionData =
            sectionDataSelector data

        style =
            [ displayFlexRowReverse
            , breakpointPortfolioMedium
                [ if reverse then
                    displayFlexRowReverse

                  else
                    displayFlexRow
                ]
            , alignItems center
            ]
    in
    styled span
        style
        []
        [ viewLinkIcon assets.iconSource sectionData.portfolioIconBackground
        , viewLinkButton sectionData.id sectionData.name
        ]


viewLinkIcon : IconSource -> IconBackground -> Html Msg
viewLinkIcon =
    iconSpan
        [ marginRight <| px -24
        , breakpointPortfolioMedium
            [ marginRight zero
            ]
        ]


viewLinkButton : String -> String -> Html Msg
viewLinkButton fragmentID linkText =
    let
        style =
            [ Button.border
            , Button.sizeMedium
            , Button.text
            , marginTopBottom <| px 10
            , marginRightLeft <| px 18
            , breakpointPortfolioMedium
                [ minWidth <| em 6.2
                ]
            ]
    in
    styled a
        style
        [ href <| "#" ++ fragmentID ]
        [ text linkText ]
