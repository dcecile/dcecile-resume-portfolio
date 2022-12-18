module View.Metrics exposing
    ( printBorderWidth
    , printLineHeight
    , standardBorderRadius
    , standardBorderWidth
    , standardLineHeight
    , standardPrintFontSize
    , standardScreenFontSizeLarge
    , standardScreenFontSizeSmall
    )

import Css exposing (Em, Pct, Pt, Px, em, pct, pt, px)


standardBorderRadius : Px
standardBorderRadius =
    px 14


standardBorderWidth : Px
standardBorderWidth =
    px 2


standardLineHeight : Float
standardLineHeight =
    1.7


standardScreenFontSizeSmall : Pct
standardScreenFontSizeSmall =
    pct 125


standardScreenFontSizeLarge : Pct
standardScreenFontSizeLarge =
    pct 145


standardPrintFontSize : Pt
standardPrintFontSize =
    pt 11


printLineHeight : Float
printLineHeight =
    1.7


printBorderWidth : Em
printBorderWidth =
    em 0.06
