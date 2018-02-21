module View.Leaf
    exposing
        ( viewLeaf
        )

import Css exposing (em, height, num, opacity, width)
import Msg exposing (Msg)
import Svg.Styled exposing (Svg, path, styled, svg)
import Svg.Styled.Attributes exposing (d)
import SvgShorthand exposing (fill, rotate, scale, stroke, strokeWidthUnscaled, transform, translate, viewBoxSquare)
import View.Colors exposing (extraPaleGreen, green)
import View.Metrics exposing (standardBorderWidth)


leafViewBox : Float
leafViewBox =
    100


leafCenter : Float
leafCenter =
    leafViewBox / 2


viewLeaf : Svg Msg
viewLeaf =
    let
        size =
            em 4

        style =
            [ width size
            , height size
            , fill extraPaleGreen
            , stroke green
            ]
    in
    styled svg
        style
        [ viewBoxSquare leafViewBox
        ]
        [ viewLeafPath
            0.5
            -5
            ( 30, 5 )
        , viewLeafPath
            0.4
            20
            ( 0, 30 )
        ]


viewLeafPath : Float -> Float -> ( Float, Float ) -> Svg Msg
viewLeafPath size degrees ( x, y ) =
    let
        style =
            [ opacity <| num 0.15
            , strokeWidthUnscaled standardBorderWidth size
            ]
    in
    styled path
        style
        [ transform
            [ translate x y
            , scale size
            , translate leafCenter leafCenter
            , rotate degrees
            , translate -leafCenter -leafCenter
            ]
        , d "M 4,15 C 22,59 43,93 96,79 C 74,39 57,-9 4,15 Z"
        ]
        []
