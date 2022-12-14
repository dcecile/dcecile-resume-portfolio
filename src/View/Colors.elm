module View.Colors exposing
    ( black
    , blackLevel
    , extraPaleGreen
    , gray
    , green
    , paleGreen
    , printBlack
    , printGray
    , printGreen
    , printPaleGreen
    , printPaleGreenComponents
    , white
    )

import Css exposing (Color, hex, hsl, rgb)


blackLevel : Int
blackLevel =
    0x11


black : Color
black =
    rgb blackLevel blackLevel blackLevel


gray : Color
gray =
    hex "#404040"


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
    hex "#808080"


printPaleGreenComponents : ( Float, Float, Float )
printPaleGreenComponents =
    ( greenHue, 0.5, 0.82 )


printPaleGreen : Color
printPaleGreen =
    let
        ( h, s, l ) =
            printPaleGreenComponents
    in
    hsl h s l


printGreen : Color
printGreen =
    hsl greenHue 0.86 0.34
