module View.Wheel
    exposing
        ( viewWheel
        )

import Css exposing (Style, px)
import CssShorthand exposing (animationCycle)
import Msg exposing (Msg)
import Svg.Styled exposing (Svg, circle, g, path, styled)
import Svg.Styled.Attributes exposing (cx, cy, d, r)
import SvgShorthand exposing (fill, rotate, scale, strokeWidth, transform, translate)
import View.Colors exposing (paleGreen)


wheelAnimation : String -> Style
wheelAnimation =
    animationCycle 4000


wheelRadius : Float
wheelRadius =
    20


wheelScale : Float
wheelScale =
    0.1


wheelCenter : ( Float, Float )
wheelCenter =
    ( 50, 36 )


viewWheel : Svg Msg
viewWheel =
    let
        style =
            [ wheelAnimation "wheelCycle"
            ]
    in
    styled g
        style
        []
        [ viewHub 30
        , viewX 90
        , viewCrescent 150
        , viewStar 210
        , viewSquare 270
        , viewTriangle 330
        ]


viewHub : Float -> Svg Msg
viewHub =
    let
        style =
            [ fill paleGreen
            , strokeWidth <| px 0
            ]
    in
    viewItem
        "wheelHubRotateCycle"
        "wheelHubTranslateCycle"
        (styled circle
            style
            [ cx "0", cy "0", r "50" ]
            []
        )


viewTriangle : Float -> Svg Msg
viewTriangle =
    viewSpoke
        "M 45.46875 -45.726562 L 15.720703 -37.755859 A 40.908627 40.908627 0 0 0 0 -40.908203 A 40.908627 40.908627 0 0 0 -32.429688 -24.853516 L -63.304688 -16.580078 L -40.386719 6.3378906 A 40.908627 40.908627 0 0 0 -6.3652344 40.359375 L 16.322266 63.046875 L 24.439453 32.753906 A 40.908627 40.908627 0 0 0 40.908203 0 A 40.908627 40.908627 0 0 0 37.541016 -16.138672 L 45.46875 -45.726562 z"


viewCrescent : Float -> Svg Msg
viewCrescent =
    viewSpoke
        "M 0 -43.181641 A 43.181469 43.181469 0 0 0 -13.806641 -40.857422 A 23.107239 23.107239 0 0 1 -9.0917969 -26.900391 A 23.107239 23.107239 0 0 1 -32.199219 -3.7929688 A 23.107239 23.107239 0 0 1 -42.660156 -6.3242188 A 43.181469 43.181469 0 0 0 -43.181641 0 A 43.181469 43.181469 0 0 0 0 43.181641 A 43.181469 43.181469 0 0 0 43.181641 0 A 43.181469 43.181469 0 0 0 0 -43.181641 z"


viewStar : Float -> Svg Msg
viewStar =
    viewSpoke
        "M 8.234375 -53.931641 L 0.03125 -37.876953 A 37.87817 37.87817 0 0 0 0 -37.878906 A 37.87817 37.87817 0 0 0 -30.53125 -22.347656 L -47.847656 -24.783203 L -35.677734 -12.585938 A 37.87817 37.87817 0 0 0 -37.878906 0 A 37.87817 37.87817 0 0 0 -30.234375 22.757812 L -37.457031 37.560547 L -22.859375 30.142578 A 37.87817 37.87817 0 0 0 0 37.878906 A 37.87817 37.87817 0 0 0 13.185547 35.484375 L 25.046875 46.943359 L 22.453125 30.451172 A 37.87817 37.87817 0 0 0 37.878906 0 A 37.87817 37.87817 0 0 0 37.830078 -1.3867188 L 53.285156 -9.6015625 L 35.744141 -12.400391 A 37.87817 37.87817 0 0 0 11.373047 -36.121094 L 8.234375 -53.931641 z"


viewSquare : Float -> Svg Msg
viewSquare =
    viewSpoke
        "m -37.485101,-37.540707 c 21.499012,-3.704767 43.0318149,-7.373868 75.026748,0 8.110137,25.008032 6.167118,50.016063 0,75.024095 -25.008916,4.08878 -50.017832,5.98674 -75.026748,0 -7.940743,-23.925242 -5.059775,-49.326118 0,-75.024095 z"


viewX : Float -> Svg Msg
viewX =
    viewSpoke
        "m -41.785591,-28.215218 5.268774,5.268774 a 43.181469,43.181469 0 0 0 -0.0097,45.902555 l -5.259106,5.259107 13.570373,13.570373 5.268774,-5.268774 a 43.181469,43.181469 0 0 0 45.902555,0.0097 l 5.259107,5.259106 13.570373,-13.570373 -5.268774,-5.268774 a 43.181469,43.181469 0 0 0 0.0097,-45.902555 l 5.259106,-5.259107 -13.570373,-13.570373 -5.268774,5.268774 a 43.181469,43.181469 0 0 0 -45.902555,-0.0097 l -5.259107,-5.259106 z"


viewSpoke : String -> Float -> Svg Msg
viewSpoke pathData =
    let
        style =
            [ strokeWidth <| px (1 / wheelScale)
            , wheelAnimation "wheelSpokeLocalCycle"
            ]
    in
    viewItem
        "wheelSpokeRotateCycle"
        "wheelSpokeTranslateCycle"
        (styled path
            style
            [ d pathData ]
            []
        )


viewItem : String -> String -> Svg Msg -> Float -> Svg Msg
viewItem rotateAnimationName translateAnimationName item degrees =
    let
        endTransform =
            [ transform
                [ uncurry translate wheelCenter
                , rotate degrees ( 0, 0 )
                ]
            ]

        rotateStyle =
            [ wheelAnimation rotateAnimationName ]

        translateStyle =
            [ wheelAnimation translateAnimationName ]

        beginTransform =
            [ transform
                [ translate 0 wheelRadius
                , scale 0.1
                ]
            ]
    in
    (g endTransform << List.singleton)
        << (styled g rotateStyle [] << List.singleton)
        << (styled g translateStyle [] << List.singleton)
        << (g beginTransform << List.singleton)
    <|
        item
