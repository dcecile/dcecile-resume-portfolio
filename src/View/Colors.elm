module View.Colors
    exposing
        ( black
        , blackLevel
        , extraPaleGreen
        , green
        , paleGreen
        , printBlack
        , white
        )

import Css exposing (Color, hex, rgb)


black : Color
black =
    rgb blackLevel blackLevel blackLevel


blackLevel : Int
blackLevel =
    0x11


green : Color
green =
    hex "#00a934"


extraPaleGreen : Color
extraPaleGreen =
    hex "#ddfde6"


paleGreen : Color
paleGreen =
    hex "#a5deb7"


printBlack : Color
printBlack =
    hex "#000000"


white : Color
white =
    hex "#ffffff"
