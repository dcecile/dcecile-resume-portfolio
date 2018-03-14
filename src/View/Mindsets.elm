module View.Mindsets
    exposing
        ( viewMindsets
        )

import Css exposing (Em, alignItems, backgroundColor, center, em, flexWrap, height, justifyContent, marginBottom, minWidth, width, wrap)
import CssShorthand exposing (batchMap, displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom)
import Html.Styled exposing (Html, a, div, span, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (onClickPreventDefault)
import Model exposing (Model)
import Msg exposing (Msg, clickDetailsOpen)
import View.Button as Button
import View.Colors exposing (white)
import View.MindsetsCircle exposing (viewMindsetsCircle)
import View.Section exposing (viewSection)


itemSize : Em
itemSize =
    em 9.0


itemButtonOffset : Em
itemButtonOffset =
    em -3.4


itemButtonWidth : Em
itemButtonWidth =
    em 5.3


viewMindsets : Model -> Html Msg
viewMindsets model =
    let
        sectionData =
            model.data.mindsets
    in
    viewSection
        model.iconSource
        sectionData
        [ viewItems sectionData.items
        ]


viewItems : List String -> Html Msg
viewItems items =
    let
        style =
            [ displayFlexRow
            , flexWrap wrap
            , justifyContent center
            , marginBottom <| em 0.5
            ]
    in
    items
        |> List.map viewItem
        |> styled div style []


viewItem : String -> Html Msg
viewItem item =
    let
        style =
            [ Button.text
            , displayFlexColumn
            , alignItems center
            , batchMap [ width, height ] itemSize
            , marginTopBottom <| em 0.4
            , marginRightLeft <| em 0.8
            ]
    in
    styled a
        style
        [ href "#"
        , onClickPreventDefault (clickDetailsOpen item)
        ]
        [ viewItemBackground
        , viewItemLink item
        ]


viewItemBackground : Html Msg
viewItemBackground =
    let
        style =
            [ batchMap [ width, height ] itemSize
            , marginBottom itemButtonOffset
            ]
    in
    viewMindsetsCircle style


viewItemLink : String -> Html Msg
viewItemLink item =
    let
        style =
            [ Button.border
            , Button.sizeMedium
            , minWidth itemButtonWidth
            , backgroundColor white
            ]
    in
    styled span
        style
        []
        [ text item ]
