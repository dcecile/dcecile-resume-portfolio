module View.Metrics
    exposing
        ( standardBorderRadius
        , standardBorderWidth
        , standardLineHeight
        , standardScreenFontSize
        )

import Css exposing (Pct, Px, num, pct, px)


standardBorderRadius : Px
standardBorderRadius =
    px 14


standardBorderWidth : Px
standardBorderWidth =
    px 2


standardLineHeight : Float
standardLineHeight =
    1.6


standardScreenFontSize : Pct
standardScreenFontSize =
    pct 155
