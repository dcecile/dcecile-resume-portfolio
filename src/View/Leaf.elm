module View.Leaf
    exposing
        ( viewLeaf
        )

import Css exposing (Em, em, height, num, opacity, width)
import CssShorthand exposing (batchMap)
import Msg exposing (Msg)
import Svg.Styled exposing (Svg, g, path, styled, svg)
import Svg.Styled.Attributes exposing (d)
import SvgShorthand exposing (fill, flipAxes, rotate, scale, stroke, strokeWidthUnscaled, transform, translate, viewBoxSquare)
import View.Colors exposing (extraPaleGreen, green)
import View.Metrics exposing (standardBorderWidth)


leafSize : Em
leafSize =
    em 4.5


leafOpacity : Float
leafOpacity =
    0.1


leafViewBox : Float
leafViewBox =
    100


leafCenter : Float
leafCenter =
    leafViewBox / 2


viewLeaf : Bool -> Bool -> Float -> Svg Msg
viewLeaf flipX flipY size =
    let
        style =
            [ batchMap [ width, height ] leafSize
            , fill extraPaleGreen
            , stroke green
            , opacity <| num leafOpacity
            ]
    in
    styled svg
        style
        [ viewBoxSquare leafViewBox
        ]
        [ g
            [ transform
                [ translate leafCenter leafCenter
                , flipAxes flipX flipY
                , translate -leafCenter -leafCenter
                , scale size
                ]
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
        ]


viewLeafPath : Float -> Float -> ( Float, Float ) -> Svg Msg
viewLeafPath size degrees ( x, y ) =
    let
        style =
            [ strokeWidthUnscaled standardBorderWidth size
            ]
    in
    styled path
        style
        [ transform
            [ translate x y
            , scale size
            , rotate degrees ( leafCenter, leafCenter )
            ]
        , d "M 4,15 C 22,59 43,93 96,79 C 74,39 57,-9 4,15 Z"
        ]
        []
