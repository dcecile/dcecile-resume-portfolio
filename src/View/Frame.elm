module View.Frame
    exposing
        ( viewFrame
        )

import Css exposing (height, justifyContent, marginBottom, spaceBetween, vh)
import CssShorthand exposing (displayFlexColumn, displayFlexRow)
import Html.Styled exposing (Html, div, styled)
import Msg exposing (Msg)
import View.Leaf exposing (viewLeaf)


viewFrame : Html Msg
viewFrame =
    let
        style =
            [ displayFlexColumn
            , justifyContent spaceBetween
            , marginBottom <| vh -100
            , height <| vh 100
            ]
    in
    styled div
        style
        []
        [ viewFrameRow
            [ viewLeaf False False 1
            , viewLeaf True False 0.8
            ]
        , viewFrameRow
            [ viewLeaf False True 0.8
            , viewLeaf True True 1
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
