module View.Colors
    exposing
        ( black
        , blackLevel
        , green
        , paleGreen
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


paleGreen : Color
paleGreen =
    hex "#a5deb7"
