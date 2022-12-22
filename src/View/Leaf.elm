module View.Leaf exposing
    ( leafPathData
    , leafStalkPoint
    , viewLeaf
    )

import Css exposing (Style, height, hidden, initial, num, opacity, px, visibility, width)
import Css.Media as Media
import CssShorthand exposing (animation, batchMap, mediaConditions, mediaInverseConditions, rem_)
import Msg exposing (Msg)
import Svg.Styled exposing (Svg, g, path, styled, svg)
import Svg.Styled.Attributes exposing (d)
import SvgShorthand exposing (fill, flipAxes, rotate, scale, stroke, strokeWidthUnscaled, transform, translate, viewBoxSquare)
import View.Breakpoints exposing (breakpointPortfolioLarge, breakpointPortfolioMedium)
import View.Colors exposing (extraPaleGreen, paleGreen)


leafSizeMinSizeRem : Float
leafSizeMinSizeRem =
    4


leafSizeMaxSizeRem : Float
leafSizeMaxSizeRem =
    10


leafSizeVw : Float
leafSizeVw =
    17


leafOpacity : Float
leafOpacity =
    0.4


leafViewBox : Float
leafViewBox =
    100


leafCenter : Float
leafCenter =
    leafViewBox / 2


leafCycle : Float
leafCycle =
    2500


leafDelayOffset : Float
leafDelayOffset =
    leafCycle * 0.08


leafPathData : String
leafPathData =
    "M 4,15 C 22,59 43,93 96,79 C 74,39 57,-9 4,15 Z"


leafStalkPoint : ( Float, Float )
leafStalkPoint =
    ( 4, 15 )


breakpointMinSizeRem : Float
breakpointMinSizeRem =
    leafSizeMinSizeRem / (leafSizeVw / 100)


breakpointMaxSizeRem : Float
breakpointMaxSizeRem =
    leafSizeMaxSizeRem / (leafSizeVw / 100)


breakpointMinSize : List Style -> Style
breakpointMinSize =
    mediaConditions
        [ Media.minWidth <| rem_ breakpointMinSizeRem
        , Media.maxWidth <| rem_ breakpointMaxSizeRem
        ]


breakpointMaxSize : List Style -> Style
breakpointMaxSize =
    mediaInverseConditions
        [ Media.maxWidth <| rem_ breakpointMaxSizeRem
        ]


type alias ViewLeafConfig =
    { showUnderMediumWidth : Bool
    , showUnderLargeWidth : Bool
    , flipX : Bool
    , flipY : Bool
    , size : Float
    }


viewLeaf : ViewLeafConfig -> Svg Msg
viewLeaf config =
    let
        style =
            [ if config.showUnderMediumWidth then
                visibility initial

              else
                visibility hidden
            , breakpointPortfolioLarge
                [ visibility initial
                ]
            , breakpointPortfolioMedium
                [ if config.showUnderLargeWidth then
                    visibility initial

                  else
                    visibility hidden
                ]
            , batchMap [ width, height ] (rem_ leafSizeMinSizeRem)
            , breakpointMinSize
                [ batchMap [ width, height ] (Css.vw leafSizeVw)
                ]
            , breakpointMaxSize
                [ batchMap [ width, height ] (rem_ leafSizeMaxSizeRem)
                ]
            , fill extraPaleGreen
            , stroke paleGreen
            , opacity <| num leafOpacity
            ]

        reverseAnimation =
            xor config.flipX config.flipY
    in
    styled svg
        style
        [ viewBoxSquare leafViewBox
        ]
        [ g
            [ transform
                [ translate leafCenter leafCenter
                , flipAxes config.flipX config.flipY
                , translate -leafCenter -leafCenter
                , scale config.size
                ]
            ]
            [ viewLeafPath reverseAnimation
                (if reverseAnimation then
                    leafDelayOffset

                 else
                    0
                )
                config.size
                0.5
                -5
                ( 30, 5 )
            , viewLeafPath reverseAnimation
                (if not reverseAnimation then
                    leafDelayOffset

                 else
                    0
                )
                config.size
                0.4
                20
                ( 0, 30 )
            ]
        ]


viewLeafPath : Bool -> Float -> Float -> Float -> Float -> ( Float, Float ) -> Svg Msg
viewLeafPath reverseAnimation delay parentSize size degrees ( x, y ) =
    let
        style =
            [ strokeWidthUnscaled (px 2) (parentSize * size)
            , animation <|
                String.join " "
                    [ "leafCycle"
                    , String.fromFloat leafCycle ++ "ms"
                    , String.fromFloat delay ++ "ms"
                    , "infinite"
                    , if reverseAnimation then
                        "alternate-reverse"

                      else
                        "alternate"
                    , "both"
                    ]
            ]
    in
    g
        [ transform
            [ translate x y
            , scale size
            , rotate degrees ( leafCenter, leafCenter )
            ]
        ]
        [ styled path
            style
            [ d leafPathData ]
            []
        ]
