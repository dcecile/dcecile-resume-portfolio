module View.Button
    exposing
        ( border
        , borderCenter
        , sizeLarge
        , sizeMedium
        , sizeSmall
        , text
        )

import Css exposing (Style, batch, borderRadius, borderWidth, boxShadow5, color, em, lineHeight, none, num, px, textDecoration, zero)
import CssShorthand exposing (borderSolidColor, paddingRightLeft)
import View.Colors exposing (black, green, paleGreen)
import View.Metrics exposing (standardBorderRadius, standardBorderWidth)


border : Style
border =
    batch
        [ borderSolidColor black
        , borderWidth standardBorderWidth
        , borderRadius standardBorderRadius
        , boxShadow5
            (px 5)
            (px 5)
            zero
            (px -1)
            paleGreen
        ]


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
        [ paddingRightLeft <| em 0.4
        , lineHeight <| num 1.7
        ]


sizeMedium : Style
sizeMedium =
    batch
        [ paddingRightLeft <| em 0.8
        , lineHeight <| num 2.1
        ]


sizeLarge : Style
sizeLarge =
    batch
        [ paddingRightLeft <| em 1.1
        , lineHeight <| num 2.4
        ]


text : Style
text =
    batch
        [ color black
        , textDecoration none
        ]
