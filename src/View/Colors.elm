module View.Colors
    exposing
        ( black
        , blackLevel
        , extraPaleGreen
        , green
        , paleGreen
        , printBlack
        , printGray
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


white : Color
white =
    hex "#ffffff"


printBlack : Color
printBlack =
    hex "#000000"


printGray : Color
printGray =
    hex "#e4e4e4"
