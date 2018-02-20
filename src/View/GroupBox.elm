module View.GroupBox
    exposing
        ( border
        )

import Css exposing (Style, batch, border3, borderRadius, hex, px, solid)
import View.Colors exposing (paleGreen)
import View.Metrics exposing (standardBorderRadius, standardBorderWidth)


border : Style
border =
    batch
        [ border3
            standardBorderWidth
            solid
            paleGreen
        , borderRadius standardBorderRadius
        ]
