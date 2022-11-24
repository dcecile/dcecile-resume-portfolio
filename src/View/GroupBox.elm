module View.GroupBox exposing (border)

import Css exposing (Style, batch, borderRadius, borderWidth)
import CssShorthand exposing (borderSolidColor)
import View.Colors exposing (paleGreen)
import View.Metrics exposing (standardBorderRadius, standardBorderWidth)


border : Style
border =
    batch
        [ borderSolidColor paleGreen
        , borderWidth standardBorderWidth
        , borderRadius standardBorderRadius
        ]
