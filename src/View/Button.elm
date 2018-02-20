module View.Button
    exposing
        ( border
        , text
        )

import Css exposing (Style, batch, border3, borderRadius, boxShadow5, color, none, px, solid, textDecoration, zero)
import View.Metrics exposing (standardBorderRadius, standardBorderWidth)
import View.Colors exposing (black, green, paleGreen)


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
            paleGreen
        ]


text : Style
text =
    batch
        [ color black
        , textDecoration none
        ]
