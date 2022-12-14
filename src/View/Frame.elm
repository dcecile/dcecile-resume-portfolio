module View.Frame exposing (viewFrame)

import Css exposing (absolute, bottom, justifyContent, left, position, px, right, spaceBetween, top)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, zIndexBackground)
import Html.Styled exposing (Html, div, styled)
import Msg exposing (Msg)
import View.Leaf exposing (viewLeaf)


viewFrame : Html Msg
viewFrame =
    let
        style =
            [ position absolute
            , top <| px 4
            , right <| px 4
            , bottom <| px 4
            , left <| px 4
            , zIndexBackground
            , displayFlexColumn
            , justifyContent spaceBetween
            ]
    in
    styled div
        style
        []
        [ viewFrameRow
            [ viewLeaf
                { showUnderMediumWidth = False
                , showUnderLargeWidth = False
                , flipX = False
                , flipY = False
                , size = 1
                }
            , viewLeaf
                { showUnderMediumWidth = True
                , showUnderLargeWidth = True
                , flipX = True
                , flipY = False
                , size = 0.8
                }
            ]
        , viewFrameRow
            [ viewLeaf
                { showUnderMediumWidth = False
                , showUnderLargeWidth = True
                , flipX = False
                , flipY = True
                , size = 0.8
                }
            , viewLeaf
                { showUnderMediumWidth = False
                , showUnderLargeWidth = True
                , flipX = True
                , flipY = True
                , size = 1
                }
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
