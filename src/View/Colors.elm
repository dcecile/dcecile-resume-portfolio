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


white : Color
white =
    hex "#ffffff"


printBlack : Color
printBlack =
    hex "#000000"


printGray : Color
printGray =
    hex "#e4e4e4"
