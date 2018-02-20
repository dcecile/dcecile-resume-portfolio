module View.GroupBox
    exposing
        ( border
        )

import Css exposing (Style, batch, border3, borderRadius, hex, px, solid)


border : Style
border =
    batch
        [ border3
            (px 2)
            solid
            (hex "#a5deb7")
        , borderRadius <| px 14
        ]
