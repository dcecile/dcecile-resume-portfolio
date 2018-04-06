module View.Mindsets
    exposing
        ( viewMindsets
        )

import Css exposing (Em, alignItems, backgroundColor, capitalize, center, em, flexWrap, height, justifyContent, marginBottom, minWidth, textTransform, width, wrap)
import CssShorthand exposing (batchMap, displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom)
import Data.Mindsets exposing (MindsetsData, MindsetsItemData)
import Html.Styled exposing (Html, a, div, span, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (onClickPreventDefault)
import Model exposing (Model)
import Msg exposing (Msg, clickDetailsOpen)
import Svg.Styled exposing (Svg)
import View.Button as Button
import View.Castle exposing (viewCastle)
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
        [ viewItems sectionData
        ]


viewItems : MindsetsData -> Html Msg
viewItems data =
    let
        style =
            [ displayFlexRow
            , flexWrap wrap
            , justifyContent center
            , marginBottom <| em 0.8
            ]
    in
    [ ( .making, Just viewCastle )
    , ( .learning, Nothing )
    , ( .teaching, Nothing )
    , ( .analyzing, Nothing )
    , ( .coordinating, Nothing )
    , ( .improving, Nothing )
    ]
        |> List.map (\( itemSelector, illustration ) -> viewItem (itemSelector data) illustration)
        |> styled div style []


viewItem : MindsetsItemData -> Maybe (Svg Msg) -> Html Msg
viewItem item illustration =
    let
        style =
            [ Button.text
            , displayFlexColumn
            , alignItems center
            , batchMap [ width, height ] itemSize
            , marginBottom <| em 0.8
            , marginRightLeft <| em 0.8
            ]
    in
    styled a
        style
        [ href "#"
        , onClickPreventDefault (clickDetailsOpen item)
        ]
        [ viewItemBackground illustration
        , viewItemLink item.name
        ]


viewItemBackground : Maybe (Svg Msg) -> Html Msg
viewItemBackground illustration =
    let
        style =
            [ batchMap [ width, height ] itemSize
            , marginBottom itemButtonOffset
            ]
    in
    viewMindsetsCircle style illustration


viewItemLink : String -> Html Msg
viewItemLink name =
    let
        style =
            [ Button.borderCenter
            , Button.sizeMedium
            , minWidth itemButtonWidth
            , backgroundColor white
            , textTransform capitalize
            ]
    in
    styled span
        style
        []
        [ text name ]
