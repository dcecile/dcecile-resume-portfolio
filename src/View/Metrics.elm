module View.Metrics
    exposing
        ( standardBorderRadius
        , standardBorderWidth
        , standardLineHeight
        , standardPrintFontSize
        , standardScreenFontSize
        )

import Css exposing (Pct, Pt, Px, num, pct, pt, px)


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


standardPrintFontSize : Pt
standardPrintFontSize =
    pt 14
