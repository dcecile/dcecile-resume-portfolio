module View.Castle
    exposing
        ( viewCastle
        )

import Css exposing (Style, px)
import CssShorthand exposing (animationCycle)
import Msg exposing (Msg)
import Svg.Styled exposing (Svg, circle, g, path, styled)
import Svg.Styled.Attributes exposing (cx, cy, d, r)
import SvgShorthand exposing (fill, strokeWidth)
import View.Colors exposing (paleGreen)


castleAnimation : String -> Style
castleAnimation =
    animationCycle 4000


viewCastle : Svg Msg
viewCastle =
    let
        style =
            [ castleAnimation "castleCycle"
            ]
    in
    styled g
        style
        []
        [ viewCloud
        , viewCircle
        , viewBuilding
        ]


viewCloud : Svg Msg
viewCloud =
    let
        pathData =
            "m 49.669689,51.130694 c -0.55827,0.0068 -2.017539,-0.348242 -2.251636,-1.965832 -0.234098,-1.617593 1.368633,-3.272122 3.569874,-4.571364 2.201242,-1.299243 5.796936,-1.359869 8.211455,-0.948025 1.357128,0.231486 4.181632,1.651179 4.608378,4.201258 m -2.409329,1.370795 c 2.850469,-1.018848 5.13341,-0.269543 5.745242,1.157238 0.611833,1.426779 0.795948,4.378647 -0.63823,5.889104 -1.434181,1.510459 -5.491523,2.847759 -6.700428,0.04289 -1.208907,-2.804867 2.69035,-3.089137 2.602086,-1.746583 m -3.845951,2.185829 c -0.301058,1.699772 -3.934925,-0.655973 -5.842399,-0.808203 -1.907476,-0.152226 -3.575831,1.401278 -5.802422,1.547641 -2.226592,0.146348 -4.013997,-0.07104 -5.75479,-1.443346 -1.740793,-1.372295 -1.561415,-4.591625 0.862353,-4.71347 m -2.584259,4.473038 c 0,0 -2.216326,-1.324063 -5.39127,-1.485908 -3.174945,-0.161853 -4.961824,-0.248501 -8.017864,-1.911727 4.001964,0.48945 9.665824,0.452843 11.636802,-2.149931 1.970979,-2.602772 5.451496,-4.607786 9.018158,-3.32378"
    in
    path
        [ d pathData ]
        []


viewCircle : Svg Msg
viewCircle =
    let
        style =
            [ fill paleGreen
            , strokeWidth <| px 0
            , castleAnimation "castleCircleCycle"
            ]
    in
    styled circle
        style
        [ cx "50", cy "35", r "4" ]
        []


viewBuilding : Svg Msg
viewBuilding =
    let
        style =
            [ fill paleGreen
            , strokeWidth <| px 0
            ]
    in
    styled g
        style
        []
        [ viewBuildingLeft
        , viewBuildingCenter
        , viewBuildingRight
        ]


viewBuildingLeft : Svg Msg
viewBuildingLeft =
    let
        style =
            [ castleAnimation "castleBuildingLeftCycle"
            ]

        pathData =
            "m 38.523438,22.701172 -3.417969,0.470703 0.05469,2.115234 -1.392578,0.296875 -0.07617,-2.177734 -4.126953,0.939453 0.998047,2.125 -1.296875,0.46875 -1.234375,-2.123047 -3.417969,2.351563 2.947266,5.996093 4.480469,-0.58789 3.300781,12.929687 6.011719,-2.115234 -1.060547,-11.755859 2.474609,-1.292969 1.296875,-7.523438 -3.888672,-0.117187 -0.6875,2.517578 -1.296875,0.117188 z"
    in
    styled path
        style
        [ d pathData ]
        []


viewBuildingCenter : Svg Msg
viewBuildingCenter =
    let
        style =
            [ castleAnimation "castleBuildingCenterCycle"
            ]

        pathData =
            "m 57.152344,29.974609 -1.6875,0.222657 0.160156,0.746093 -0.970703,0.414063 -0.07031,-1.044922 -1.585937,0.3125 0.166015,0.767578 -1.214843,0.310547 -0.195313,-1.019531 -1.33789,0.201172 0.197265,0.853515 -1.091797,0.01758 -0.255859,-0.74414 -1.722656,0.36914 0.228515,0.910157 -1.076172,0.154296 -0.199218,-1.109374 -2.103516,0.314453 0.275391,1.226562 h -1.041016 l -0.169922,-1.103515 -1.564453,0.205078 0.138672,10.849609 6.935547,-0.414063 c 0,0 -1.510491,-6.976884 1.160156,-7.105468 2.670646,-0.128592 2.863281,6.27539 2.863281,6.27539 l 5.826172,-0.138672 z"
    in
    styled path
        style
        [ d pathData ]
        []


viewBuildingRight : Svg Msg
viewBuildingRight =
    let
        style =
            [ castleAnimation "castleBuildingRightCycle"
            ]

        pathData =
            "M 59.191406,21.023438 59.136719,23.875 h -1.248047 l -0.361328,-2.021484 -3.46875,0.966796 1.25,6.080079 3.605468,0.96875 0.833985,12.023437 5.130859,1.38086 0.832032,-11.19336 2.914062,-0.138672 3.189453,-8.291015 -3.050781,-1.521485 -0.960938,2.160156 -1.664062,-0.138671 0.958984,-2.574219 -3.189453,-0.414063 -0.332031,2.435547 -1.386719,-0.27539 -0.222656,-2.298828 z"
    in
    styled path
        style
        [ d pathData ]
        []
