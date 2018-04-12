module View.Projects
    exposing
        ( viewProjects
        )

import Assets exposing (Assets)
import Css exposing (bold, center, color, em, flexWrap, fontSize, fontStyle, fontWeight, italic, justifyContent, left, marginBottom, px, textAlign, width, wrap)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom, paddingRightLeft, paddingTopBottom)
import Data exposing (Data)
import Data.Projects exposing (ProjectsItemData)
import Html.Styled exposing (Html, a, div, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (onClickPreventDefault)
import Msg exposing (Msg, clickDetailsOpen)
import View.Button as Button
import View.Colors exposing (green)
import View.Section exposing (viewSection)


viewProjects : Assets -> Data -> Html Msg
viewProjects assets data =
    let
        sectionData =
            data.projects
    in
    viewSection
        assets.iconSource
        sectionData
        [ viewItems sectionData.items
        ]


viewItems : List ProjectsItemData -> Html Msg
viewItems items =
    let
        style =
            [ displayFlexRow
            , flexWrap wrap
            , justifyContent center
            , marginRightLeft <| em 0.5
            , marginBottom <| em 1.0
            ]
    in
    items
        |> List.map viewItem
        |> styled div style []


viewItem : ProjectsItemData -> Html Msg
viewItem item =
    let
        style =
            [ Button.border
            , Button.text
            , displayFlexColumn
            , marginTopBottom <| px 16
            , marginRightLeft <| px 14
            , paddingTopBottom <| em 0.8
            , paddingRightLeft <| em 1.0
            , width <| em 8.0
            , textAlign left
            , fontSize <| em 0.85
            ]
    in
    styled a
        style
        [ href "#"
        , onClickPreventDefault (clickDetailsOpen item)
        ]
        [ viewName <| Maybe.withDefault item.name item.shortName
        , viewTech item.tech
        , viewDescription item.description
        ]


viewName : String -> Html Msg
viewName name =
    let
        style =
            [ fontWeight bold
            , marginBottom <| em 0.3
            ]
    in
    styled div
        style
        []
        [ text name ]


viewTech : String -> Html Msg
viewTech tech =
    let
        style =
            [ color green
            , marginBottom <| em 0.3
            ]
    in
    styled div
        style
        []
        [ text tech ]


viewDescription : String -> Html Msg
viewDescription description =
    let
        style =
            [ fontStyle italic
            , marginBottom <| em 0.2
            ]
    in
    styled div
        style
        []
        [ text description ]
