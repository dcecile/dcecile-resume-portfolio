module View.Section
    exposing
        ( viewSection
        )

import Css exposing (backgroundPosition2, bold, borderWidth, em, fontSize, fontStyle, fontWeight, height, left, marginBottom, marginLeft, marginTop, num, opacity, textAlign, top, zero)
import CssShorthand exposing (borderBottomSolidColor, displayFlexColumn)
import Data exposing (SectionDataSelector)
import Html.Styled exposing (Html, div, h2, p, section, styled, text)
import Html.Styled.Attributes exposing (id)
import Icon exposing (IconBackground, IconSource)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Colors exposing (black)
import View.Metrics exposing (standardBorderWidth)


viewSection : Model -> SectionDataSelector -> Html Msg
viewSection model sectionDataSelector =
    let
        sectionData =
            sectionDataSelector model.data

        style =
            [ displayFlexColumn
            , borderBottomSolidColor black
            , borderWidth standardBorderWidth
            ]
    in
    styled section
        style
        [ id sectionData.id ]
        [ viewBackgroundIcon model.iconSource sectionData.iconBackground
        , viewHeader sectionData.name
        ]


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
            , marginBottom <| em 8.0
            , marginLeft <| em 1.3
            , textAlign left
            , fontWeight bold
            , fontSize <| em 1.4
            ]
    in
    styled h2
        style
        []
        [ text headerText ]
