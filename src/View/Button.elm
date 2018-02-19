module View.Button
    exposing
        ( border
        , text
        )

import Css exposing (Style, batch, border3, borderRadius, boxShadow5, color, hex, none, px, solid, textDecoration, zero)
import Css.Colors exposing (black)


border : Style
border =
    batch
        [ border3
            (px 2)
            solid
            black
        , borderRadius <| px 16
        , boxShadow5
            (px 5)
            (px 5)
            zero
            (px -1)
            (hex "#dedede")
        ]


text : Style
text =
    batch
        [ color black
        , textDecoration none
        ]
