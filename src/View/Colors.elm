module View.Colors exposing
    ( black
    , blackLevel
    , darkGreen
    , extraDarkGreen
    , extraPaleGreen
    , green
    , paleGreen
    , printBlack
    , printGreen
    , printPaleGreen
    , white
    )

import Css exposing (Color, hex, hsl, rgb)


blackLevel : Int
blackLevel =
    0x11


black : Color
black =
    rgb blackLevel blackLevel blackLevel


greenHue : Float
greenHue =
    151


green : Color
green =
    hsl greenHue 1.0 0.37


extraPaleGreen : Color
extraPaleGreen =
    hsl greenHue 0.89 0.99


paleGreen : Color
paleGreen =
    hsl greenHue 0.62 0.79


darkGreen : Color
darkGreen =
    hsl greenHue 0.82 0.28


extraDarkGreen : Color
extraDarkGreen =
    hsl greenHue 0.62 0.15


white : Color
white =
    hex "#ffffff"


printBlack : Color
printBlack =
    hex "#000000"


printPaleGreen : Color
printPaleGreen =
    hsl greenHue 0.5 0.82


printGreen : Color
printGreen =
    hsl greenHue 0.86 0.34
