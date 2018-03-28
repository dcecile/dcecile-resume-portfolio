module View.Metrics
    exposing
        ( printBorderWidth
        , standardBorderRadius
        , standardBorderWidth
        , standardLineHeight
        , standardPrintFontSize
        , standardScreenFontSize
        )

import Css exposing (Em, Pct, Pt, Px, em, num, pct, pt, px)


standardBorderRadius : Px
standardBorderRadius =
    px 14


standardBorderWidth : Px
standardBorderWidth =
    px 2


standardLineHeight : Float
standardLineHeight =
    1.7


standardScreenFontSize : Pct
standardScreenFontSize =
    pct 155


standardPrintFontSize : Pt
standardPrintFontSize =
    pt 12


printBorderWidth : Em
printBorderWidth =
    em 0.06
