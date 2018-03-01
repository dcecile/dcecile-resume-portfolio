module View.Work
    exposing
        ( viewWork
        )

import Css exposing (bold, center, color, em, flexWrap, fontSize, fontStyle, fontWeight, italic, justifyContent, left, marginBottom, marginTop, paddingRight, px, textAlign, width, wrap)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, marginRightLeft, noStyle, paddingRightLeft, paddingTopBottom)
import Data.Work exposing (WorkItemData)
import Html.Styled exposing (Html, a, div, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (targetBlank)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Button as Button
import View.Colors exposing (green)
import View.Section exposing (viewSection)


viewWork : Model -> Html Msg
viewWork model =
    let
        sectionData =
            model.data.work
    in
    viewSection
        model.iconSource
        sectionData
        [ viewItems True sectionData.portfolioLargeItems
        , viewItems False sectionData.portfolioSmallItems
        ]


viewItems : Bool -> List WorkItemData -> Html Msg
viewItems isLarge items =
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
        |> List.map (viewItem isLarge)
        |> styled div style []


viewItem : Bool -> WorkItemData -> Html Msg
viewItem isLarge item =
    let
        style =
            [ Button.border
            , Button.text
            , if isLarge then
                displayFlexRow
              else
                displayFlexColumn
            , marginTop <| px 16
            , if isLarge then
                noStyle
              else
                marginBottom <| px 16
            , marginRightLeft <| px 14
            , paddingTopBottom <| em 0.8
            , paddingRightLeft <|
                if isLarge then
                    em 1.2
                else
                    em 1.0
            , textAlign left
            , fontSize <| em 0.85
            ]
    in
    styled a
        style
        [ href "#"
        , targetBlank
        ]
    <|
        if isLarge then
            [ viewItemColumn True <|
                List.concat
                    [ item.name |> viewName |> List.singleton
                    , item.portfolioDuration |> viewDurationTitles |> List.singleton
                    , item.portfolioTitles |> List.map (\title -> "(" ++ title ++ ")" |> viewDurationTitles)
                    ]
            , viewItemColumn False <|
                (item.portfolioSkills |> List.map viewSkills)
            ]
        else
            [ item.name |> viewName
            , ( item.portfolioDuration, item.portfolioTitles ) |> uncurry combineDurationAndTitles |> viewDurationTitles
            , item.portfolioSkills |> String.join " " |> viewSkills
            ]


viewItemColumn : Bool -> List (Html Msg) -> Html Msg
viewItemColumn usePadding =
    let
        style =
            [ displayFlexColumn
            , if usePadding then
                paddingRight <| em 1.0
              else
                noStyle
            ]
    in
    styled div style []


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


combineDurationAndTitles : String -> List String -> String
combineDurationAndTitles duration titles =
    [ duration
    , " ("
    , String.join ", " titles
    , ")"
    ]
        |> String.concat


viewDurationTitles : String -> Html Msg
viewDurationTitles durationTitles =
    let
        style =
            [ fontStyle italic
            , marginBottom <| em 0.3
            ]
    in
    styled div
        style
        []
        [ text durationTitles ]


viewSkills : String -> Html Msg
viewSkills skills =
    let
        style =
            [ color green
            , marginBottom <| em 0.3
            ]
    in
    styled div
        style
        []
        [ text skills ]
