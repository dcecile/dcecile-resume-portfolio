module View.Tech
    exposing
        ( viewTech
        )

import Css exposing (alignItems, baseline, center, color, em, flexWrap, fontStyle, italic, justifyContent, marginBottom, px, wrap)
import CssShorthand exposing (displayFlexRow, marginRightLeft, marginTopBottom)
import Dict
import Html.Styled exposing (Html, a, div, span, styled, text)
import Html.Styled.Attributes exposing (href)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Button as Button
import View.Colors exposing (paleGreen)
import View.Section exposing (viewSection, viewSectionParagraph)


viewTech : Model -> Html Msg
viewTech model =
    let
        sectionData =
            model.data.tech
    in
    viewSection
        model.iconSource
        sectionData
        [ viewSectionParagraph sectionData.intro
        , viewItems sectionData.items
        , viewSectionParagraph sectionData.outro
        ]


viewItems : List String -> Html Msg
viewItems items =
    let
        style =
            [ displayFlexRow
            , flexWrap wrap
            , alignItems baseline
            , marginRightLeft <| em 3.8
            , marginBottom <| em 1.5
            ]
    in
    items
        |> toGroup
        |> List.map (uncurry viewGroup)
        |> styled div style []


toGroup : List String -> List ( String, List String )
toGroup items =
    let
        loop item =
            Dict.update
                (key item)
                (update item)

        key =
            String.left 1 >> String.toUpper

        update item maybeGroup =
            Just <| item :: Maybe.withDefault [] maybeGroup
    in
    items
        |> List.foldr loop Dict.empty
        |> Dict.toList


viewGroup : String -> List String -> Html Msg
viewGroup key items =
    let
        style =
            [ displayFlexRow
            , alignItems baseline
            , marginTopBottom <| px 17
            , marginRightLeft <| px 8
            ]
    in
    items
        |> List.map viewItem
        |> (::) (viewKey key)
        |> styled span style []


viewKey : String -> Html Msg
viewKey key =
    let
        style =
            [ displayFlexRow
            , marginRightLeft <| px 6
            , color paleGreen
            , fontStyle italic
            ]
    in
    styled span
        style
        []
        [ text key ]


viewItem : String -> Html Msg
viewItem item =
    let
        style =
            [ Button.border
            , Button.sizeSmall
            , Button.text
            , marginRightLeft <| px 7
            ]
    in
    styled a
        style
        [ href "#" ]
        [ text item ]
