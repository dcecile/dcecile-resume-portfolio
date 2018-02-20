module View.Button
    exposing
        ( border
        , text
        )

import Css exposing (Style, batch, border3, borderRadius, boxShadow5, color, hex, none, px, solid, textDecoration, zero)
import Css.Colors exposing (black)
import View.Metrics exposing (standardBorderRadius, standardBorderWidth)


border : Style
border =
    batch
        [ border3
            standardBorderWidth
            solid
            black
        , borderRadius standardBorderRadius
        , boxShadow5
            (px 5)
            (px 5)
            zero
            (px -1)
            (hex "#a5deb7")
        ]


text : Style
text =
    batch
        [ color black
        , textDecoration none
        ]
