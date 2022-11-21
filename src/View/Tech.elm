module View.Tech exposing (viewTech)

import Assets exposing (Assets)
import Css exposing (alignItems, baseline, center, color, em, flexWrap, fontSize, fontStyle, italic, justifyContent, marginBottom, px, wrap)
import CssShorthand exposing (displayFlexRow, marginRightLeft, marginTopBottom)
import Data exposing (Data)
import Data.Tech exposing (TechItemData)
import Dict
import Html.Styled exposing (Html, a, div, span, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (onClickPreventDefault)
import Msg exposing (Msg, clickDetailsOpen)
import View.Breakpoints exposing (breakpointPortfolioMedium)
import View.Button as Button
import View.Colors exposing (paleGreen)
import View.Section exposing (viewSection)


viewTech : Assets -> Data -> Html Msg
viewTech assets data =
    let
        sectionData =
            data.tech
    in
    viewSection
        assets.iconSource
        sectionData
        [ viewItems sectionData.items
        ]


viewItems : List TechItemData -> Html Msg
viewItems items =
    let
        style =
            [ displayFlexRow
            , flexWrap wrap
            , alignItems baseline
            , marginRightLeft <| em 0.4
            , breakpointPortfolioMedium
                [ marginRightLeft <| em 3.8
                ]
            , marginBottom <| em 1.5
            , fontSize <| em 0.92
            , breakpointPortfolioMedium
                [ fontSize <| em 1.0
                ]
            ]
    in
    items
        |> toGroup
        |> List.map (\( a, b ) -> viewGroup a b)
        |> styled div style []


toGroup : List TechItemData -> List ( String, List TechItemData )
toGroup items =
    let
        loop item =
            Dict.update
                (key item)
                (update item)

        key =
            getShortName >> String.left 1 >> String.toUpper

        update item maybeGroup =
            Just <| item :: Maybe.withDefault [] maybeGroup
    in
    items
        |> List.foldr loop Dict.empty
        |> Dict.toList


getShortName : TechItemData -> String
getShortName item =
    Maybe.withDefault item.name item.shortName


viewGroup : String -> List TechItemData -> Html Msg
viewGroup key items =
    let
        style =
            [ displayFlexRow
            , alignItems baseline
            , marginRightLeft <| px 8
            ]

        itemsStyle =
            [ displayFlexRow
            , flexWrap wrap
            ]
    in
    styled span
        style
        []
        [ viewKey key
        , styled span
            itemsStyle
            []
            (List.map viewItem items)
        ]


viewKey : String -> Html Msg
viewKey key =
    let
        style =
            [ displayFlexRow
            , marginRightLeft <| px 4
            , breakpointPortfolioMedium
                [ marginRightLeft <| px 6
                ]
            , color paleGreen
            , fontStyle italic
            ]
    in
    styled span
        style
        []
        [ text key ]


viewItem : TechItemData -> Html Msg
viewItem item =
    let
        style =
            [ Button.border
            , Button.sizeSmall
            , Button.text
            , marginTopBottom <| px 11
            , breakpointPortfolioMedium
                [ marginTopBottom <| px 17
                ]
            , marginRightLeft <| px 7
            ]
    in
    styled a
        style
        [ href "#"
        , onClickPreventDefault (clickDetailsOpen item)
        ]
        [ text <| getShortName item ]
