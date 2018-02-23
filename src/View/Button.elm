module View.Button
    exposing
        ( border
        , text
        )

import Css exposing (Style, batch, borderRadius, borderWidth, boxShadow5, color, none, px, textDecoration, zero)
import CssShorthand exposing (borderSolidColor)
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


text : Style
text =
    batch
        [ color black
        , textDecoration none
        ]
