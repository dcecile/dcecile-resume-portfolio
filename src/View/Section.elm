module View.Section
    exposing
        ( viewSection
        , viewSectionBlank
        , viewSectionParagraph
        )

import Css exposing (backgroundPosition2, bold, borderWidth, center, em, flexBasis, fontSize, fontStyle, fontWeight, height, justifyContent, left, marginBottom, marginLeft, marginTop, num, opacity, textAlign, top, zero)
import CssShorthand exposing (borderBottomSolidColor, displayFlexColumn, displayFlexRow, marginRightLeft)
import Data.Section exposing (SectionData)
import Html.Styled exposing (Html, div, h2, p, section, styled, text)
import Html.Styled.Attributes exposing (id)
import Icon exposing (IconBackground, IconSource)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Colors exposing (black)
import View.Metrics exposing (standardBorderWidth)


viewSection : Model -> SectionData a -> List (Html Msg) -> Html Msg
viewSection model sectionData nodes =
    let
        style =
            [ displayFlexRow
            , justifyContent center
            , borderBottomSolidColor black
            , borderWidth standardBorderWidth
            ]

        requiredNodes =
            [ viewBackgroundIcon model.iconSource sectionData.iconBackground
            , viewHeader sectionData.name
            ]
    in
    styled section
        style
        [ id sectionData.id ]
        [ viewContent <| requiredNodes ++ nodes ]


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
            [ iconBackground iconSource
            , backgroundPosition2 zero zero
            , height iconSize
            , marginTop <| em 0.8
            , marginBottom <| em -iconSize.numericValue
            , marginLeft <| em -2.0
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
            , marginRightLeft <| em 1.3
            , marginBottom <| em 0.5
            , textAlign left
            , fontWeight bold
            , fontSize <| em 1.4
            ]
    in
    styled h2
        style
        []
        [ text headerText ]


viewSectionParagraph : String -> Html Msg
viewSectionParagraph paragraphText =
    let
        style =
            [ marginTop <| em 0.5
            , marginRightLeft <| em 3.5
            , marginBottom <| em 2.5
            , textAlign left
            ]
    in
    styled p
        style
        []
        [ text paragraphText ]


viewSectionBlank : Html Msg
viewSectionBlank =
    let
        style =
            [ marginBottom <| em 8.0
            ]
    in
    styled div
        style
        []
        []
