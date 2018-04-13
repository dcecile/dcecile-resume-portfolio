module View.Frame
    exposing
        ( viewFrame
        )

import Css exposing (height, justifyContent, marginBottom, spaceBetween, vh)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, zIndexBackground)
import Html.Styled exposing (Html, div, styled)
import Msg exposing (Msg)
import View.Breakpoints exposing (breakpointTall, breakpointTallRemLength)
import View.Leaf exposing (viewLeaf)


viewFrame : Html Msg
viewFrame =
    let
        style =
            [ zIndexBackground
            , displayFlexColumn
            , justifyContent spaceBetween
            , marginBottom <| vh -100
            , height <| vh 100
            , breakpointTall
                [ marginBottom <| Css.rem -breakpointTallRemLength
                , height <| Css.rem breakpointTallRemLength
                ]
            ]
    in
    styled div
        style
        []
        [ viewFrameRow
            [ viewLeaf False False False 1
            , viewLeaf True True False 0.8
            ]
        , viewFrameRow
            [ viewLeaf False False True 0.8
            , viewLeaf False True True 1
            ]
        ]


viewFrameRow : List (Html Msg) -> Html Msg
viewFrameRow =
    let
        style =
            [ displayFlexRow
            , justifyContent spaceBetween
            ]
    in
    styled div style []
