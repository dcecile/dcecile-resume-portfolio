module View.Section exposing (viewSection)

import Css exposing (backgroundPosition2, bold, borderWidth, boxShadow5, center, em, flexBasis, fontSize, fontWeight, height, justifyContent, left, marginBottom, marginLeft, marginTop, num, opacity, paddingBottom, px, textAlign, zero)
import CssShorthand exposing (borderBottomSolidColor, displayFlexColumn, displayFlexRow, marginRightLeft, zIndexBackground)
import Data.Section exposing (SectionData)
import Html.Styled exposing (Html, div, h2, p, section, styled, text)
import Html.Styled.Attributes exposing (id)
import Icon exposing (IconBackground, IconSource, iconBackgroundImage)
import MaybeEx
import Msg exposing (Msg)
import View.Breakpoints exposing (breakpointPortfolioMedium)
import View.Colors exposing (black, paleGreen)
import View.Metrics exposing (standardBorderWidth)


viewSection : IconSource -> SectionData a -> List (Html Msg) -> Html Msg
viewSection iconSource sectionData nodes =
    let
        style =
            [ displayFlexRow
            , justifyContent center
            , borderBottomSolidColor black
            , borderWidth standardBorderWidth
            , boxShadow5
                zero
                (px 1)
                zero
                zero
                paleGreen
            , paddingBottom <| em 1.5
            ]

        requiredNodesBefore =
            [ viewBackgroundIcon iconSource sectionData.portfolioIconBackground
            , viewHeader sectionData.name
            , viewParagraph sectionData.portfolioIntro
            ]

        requiredNodesAfter =
            sectionData.portfolioOutro
                |> Maybe.map viewParagraph
                |> MaybeEx.toList
    in
    styled section
        style
        [ id sectionData.id ]
        [ viewContent <| requiredNodesBefore ++ nodes ++ requiredNodesAfter ]


viewContent : List (Html Msg) -> Html Msg
viewContent =
    let
        style =
            [ displayFlexColumn
            , flexBasis <| em 33
            ]
    in
    styled div style []


viewBackgroundIcon : IconSource -> IconBackground -> Html Msg
viewBackgroundIcon iconSource iconBackground =
    let
        iconSize =
            em 10

        style =
            [ zIndexBackground
            , iconBackgroundImage iconSource iconBackground
            , backgroundPosition2 zero zero
            , height iconSize
            , marginTop <| em 0.8
            , marginBottom <| em -iconSize.numericValue
            , marginLeft <| em -2.6
            , breakpointPortfolioMedium
                [ marginLeft <| em -2.0
                ]
            , opacity <| num 0.025
            ]
    in
    styled div
        style
        []
        []


viewHeader : String -> Html Msg
viewHeader headerText =
    let
        style =
            [ marginTop <| em 1.2
            , marginRightLeft <| em 0.7
            , breakpointPortfolioMedium
                [ marginRightLeft <| em 1.3
                ]
            , marginBottom <| em 0.8
            , textAlign left
            , fontWeight bold
            , fontSize <| em 1.4
            ]
    in
    styled h2
        style
        []
        [ text headerText ]


viewParagraph : String -> Html Msg
viewParagraph paragraphText =
    let
        style =
            [ marginTop zero
            , marginRightLeft <| em 1.6
            , breakpointPortfolioMedium
                [ marginRightLeft <| em 3.5
                ]
            , marginBottom <| em 1.5
            , textAlign left
            ]
    in
    styled p
        style
        []
        [ text paragraphText ]
