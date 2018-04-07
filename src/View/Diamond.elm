module View.Diamond
    exposing
        ( viewDiamond
        )

import Css exposing (Style, px)
import CssShorthand exposing (animationCycle)
import Msg exposing (Msg)
import Svg.Styled exposing (Svg, g, path, styled)
import Svg.Styled.Attributes exposing (d)
import SvgShorthand exposing (fill, strokeWidth)
import View.Colors exposing (paleGreen)


diamondAnimation : String -> Style
diamondAnimation =
    animationCycle 4000


viewDiamond : Svg Msg
viewDiamond =
    let
        style =
            [ diamondAnimation "diamondCycle"
            ]
    in
    styled g
        style
        []
        [ viewRock
        , viewBlur
        , viewGem
        ]


viewRock : Svg Msg
viewRock =
    let
        style =
            [ fill paleGreen
            , strokeWidth <| px 0
            , diamondAnimation "diamondRockCycle"
            ]

        pathData =
            "m 65.919069,47.015577 1.767767,5.682108 5.177031,-11.111678 -0.252537,-3.788072 z m -18.339652,1.641498 0.04596,5.059737 3.015139,4.91552 16.414979,-5.682109 -1.641498,-6.187184 z m -12.911942,-3.598668 0.189403,5.492705 7.696068,6.988127 7.203682,1.4719 -3.254986,-4.576324 -3.327798,-2.009633 z m -0.315673,-6.029347 0.315672,5.08233 8.734071,7.566081 3.198356,2.030367 -0.133929,-5.525201 -3.22768,-1.425173 z m -5.2086,-3.933763 0.789183,9.96311 3.977475,5.366436 -0.120856,-11.633003 z m 26.361842,-12.702188 -7.54682,24.859688 17.960845,-1.752448 6.313454,-8.333759 -1.136422,-4.545686 -4.671955,-7.449875 z m -7.009771,0.45335 -16.377704,6.76917 -2.223878,2.419147 -0.971357,1.974153 14.482701,11.592215 3.321986,1.413644 8.585254,-24.68403 z m -5.931333,0.812514 -7.406746,2.807572 -2.723141,2.655665 15.768136,-6.355747 z"
    in
    styled path
        style
        [ d pathData ]
        []


viewBlur : Svg Msg
viewBlur =
    let
        style =
            [ fill paleGreen
            , strokeWidth <| px 0
            , diamondAnimation "diamondBlurCycle"
            ]

        pathData =
            "m 64.174778,53.047069 c -10.026606,5.546649 -16.000882,-6.086646 -18.01537,-6.139545 -2.014488,-0.0529 5.590051,16.45568 -5.504907,9.864791 -11.094958,-6.590889 2.356723,-16.038456 0.298947,-18.133236 -2.057776,-2.09478 -16.163265,7.369588 -11.110031,-3.084712 5.053234,-10.4543 16.606755,-4.476669 18.13341,-6.38261 1.526655,-1.905941 -16.985432,-9.635875 -1.651894,-10.00962 15.333538,-0.373745 9.489778,12.983066 11.402831,14.244011 1.913053,1.260945 7.050227,-16.623153 10.172259,-3.879356 3.122032,12.743797 -10.796134,13.389431 -11.268423,15.38219 -0.472289,1.992759 17.569784,2.591438 7.543178,8.138087 z"
    in
    styled path
        style
        [ d pathData ]
        []


viewGem : Svg Msg
viewGem =
    let
        groupStyle =
            [ diamondAnimation "diamondGemCycle"
            ]

        style =
            [ fill paleGreen
            , strokeWidth <| px 0
            ]

        pathData =
            "M 70.067622,36.306789 50.9375,56.607143 59.989167,38.462337 Z m -27.929251,2.53567 8.575915,17.496827 8.223259,-17.743021 z m -10.081627,-2.156863 18.47897,20.100118 -9.1531,-18.118655 z M 59.066987,37.715554 50.491072,26.696428 41.77674,37.994243 Z m 4.32587,-11.019125 6.875,9.285714 -9.955357,1.383928 z m -12.589286,-0.04464 8.754487,10.748097 3.686866,-10.901831 z M 38.125,26.428571 41.383928,37.5 50.179886,26.647299 Z m -0.267857,0.08929 -5.923496,9.810596 8.911394,1.454723 z"
    in
    styled g
        groupStyle
        []
        [ styled path
            style
            [ d pathData ]
            []
        , viewGemShine
        ]


viewGemShine : Svg Msg
viewGemShine =
    let
        style =
            [ diamondAnimation "diamondGemShineCycle"
            ]

        pathData =
            "m 29.505731,28.713072 -7.828682,-7.071068 m 6.905187,21.730971 -11.364216,1.010152 m 16.833397,7.310916 -8.333758,5.808377 m 38.154001,-4.723575 6.338501,6.360673 m 0.431118,-14.789994 8.112176,2.43722 m -8.040679,-18.499525 7.323606,-3.030457 m -20.42495,-5.29061 4.545686,-7.323606 m -18.891776,8.469 C 38.719656,12.52525 38.719656,12.52525 38.719656,12.52525"
    in
    styled path
        style
        [ d pathData ]
        []
