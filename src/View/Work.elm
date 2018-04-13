module View.Work
    exposing
        ( viewWork
        )

import Assets exposing (Assets)
import Css exposing (Style, alignItems, batch, bold, center, color, em, flexWrap, fontSize, fontStyle, fontWeight, italic, justifyContent, left, marginBottom, marginTop, paddingRight, px, textAlign, width, wrap)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, marginRightLeft, noStyle, paddingRightLeft, paddingTopBottom)
import Data exposing (Data)
import Data.Work exposing (WorkItemData)
import Html.Styled exposing (Html, a, div, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (onClickPreventDefault)
import Msg exposing (Msg, clickDetailsOpen)
import View.Breakpoints exposing (breakpointMedium)
import View.Button as Button
import View.Colors exposing (green)
import View.Section exposing (viewSection)


viewWork : Assets -> Data -> Html Msg
viewWork assets data =
    let
        sectionData =
            data.work
    in
    viewSection
        assets.iconSource
        sectionData
        [ viewItems True sectionData.portfolioLargeItems
        , viewItems False sectionData.portfolioSmallItems
        ]


viewItems : Bool -> List WorkItemData -> Html Msg
viewItems isLarge items =
    let
        style =
            [ displayFlexColumn
            , alignItems center
            , breakpointMedium
                [ displayFlexRow
                , flexWrap wrap
                , justifyContent center
                ]
            , marginRightLeft <| em 0.5
            , marginBottom <|
                em
                    (if isLarge then
                        0.8
                     else
                        1.1
                    )
            ]
    in
    items
        |> List.map (viewItem isLarge)
        |> styled div style []


viewItem : Bool -> WorkItemData -> Html Msg
viewItem isLarge item =
    let
        baseStyle =
            [ Button.border
            , Button.text
            , displayFlexColumn
            , marginRightLeft <| px 14
            , paddingTopBottom <| em 0.8
            , fontSize <| em 0.85
            ]

        largeStyle =
            [ batch baseStyle
            , paddingRightLeft <| em 1.2
            , breakpointMedium
                [ paddingTopBottom <| em 1.0
                , paddingRightLeft <| em 1.4
                ]
            ]

        smallStyle =
            [ batch baseStyle
            , marginTop <| px 8
            , marginBottom <| px 16
            , paddingRightLeft <| em 1.5
            , breakpointMedium
                [ paddingRightLeft <| em 1.0
                ]
            ]

        style =
            if isLarge then
                largeStyle
            else
                smallStyle
    in
    List.concat
        [ item.name |> viewName |> List.singleton
        , item.portfolioSkills |> List.map viewSkills
        , item.portfolioDuration |> viewDuration |> List.singleton
        ]
        |> styled a
            style
            [ href "#"
            , onClickPreventDefault (clickDetailsOpen item)
            ]


viewItemLine : List Style -> String -> Html Msg
viewItemLine customStyle lineText =
    let
        style =
            [ marginBottom <| em 0.3
            , batch customStyle
            ]
    in
    styled div
        style
        []
        [ text lineText ]


viewName : String -> Html Msg
viewName =
    viewItemLine
        [ fontWeight bold
        ]


viewDuration : String -> Html Msg
viewDuration =
    viewItemLine
        [ fontStyle italic
        ]


viewSkills : String -> Html Msg
viewSkills =
    viewItemLine
        [ color green
        ]
