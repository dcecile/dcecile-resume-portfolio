module View.Frame
    exposing
        ( viewFrame
        )

import Css exposing (height, marginBottom, vh)
import CssShorthand exposing (displayFlexRow)
import Html.Styled exposing (Html, div, styled)
import Msg exposing (Msg)
import View.Leaf exposing (viewLeaf)


viewFrame : Html Msg
viewFrame =
    let
        style =
            [ displayFlexRow
            , marginBottom <| vh -100
            , height <| vh 100
            ]
    in
    styled div
        style
        []
        [ viewLeaf
        ]
