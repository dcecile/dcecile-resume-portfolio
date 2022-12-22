module View.Button exposing
    ( border
    , borderCenter
    , borderShadow
    , sizeLarge
    , sizeMedium
    , sizeSmall
    , text
    )

import Css exposing (Style, batch, borderRadius, borderWidth, boxShadow5, color, em, lineHeight, noWrap, none, num, px, textDecoration, whiteSpace, zero)
import CssShorthand exposing (borderSolidColor, paddingRightLeft)
import View.Colors exposing (black, paleGreen)
import View.Metrics exposing (standardBorderRadius, standardBorderWidth)


border : Style
border =
    batch
        [ borderSolidColor black
        , borderWidth standardBorderWidth
        , borderRadius standardBorderRadius
        , borderShadow
        ]


borderShadow : Style
borderShadow =
    boxShadow5
        (px 5)
        (px 5)
        zero
        (px -1)
        paleGreen


borderCenter : Style
borderCenter =
    batch
        [ border
        , boxShadow5
            (px 0)
            (px 10)
            zero
            (px -6)
            paleGreen
        ]


sizeSmall : Style
sizeSmall =
    batch
        [ paddingRightLeft <| em 0.5
        , lineHeight <| num 1.7
        , whiteSpace noWrap
        ]


sizeMedium : Style
sizeMedium =
    batch
        [ paddingRightLeft <| em 0.8
        , lineHeight <| num 2.1
        , whiteSpace noWrap
        ]


sizeLarge : Style
sizeLarge =
    batch
        [ paddingRightLeft <| em 1.1
        , lineHeight <| num 2.4
        , whiteSpace noWrap
        ]


text : Style
text =
    batch
        [ color black
        , textDecoration none
        ]
