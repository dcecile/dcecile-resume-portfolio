module View.Seedling exposing (viewSeedling)

import Css exposing (Style, px)
import CssShorthand exposing (animationCycle)
import Msg exposing (Msg)
import Svg.Styled exposing (Svg, circle, g, path, styled)
import Svg.Styled.Attributes exposing (cx, cy, d, r)
import SvgShorthand exposing (fill, flipAxes, rotate, scale, strokeWidth, transform, translate)
import View.Colors exposing (paleGreen)
import View.Leaf exposing (leafPathData, leafStalkPoint)


seedlingAnimation : String -> Style
seedlingAnimation =
    animationCycle 4000


viewSeedling : Svg Msg
viewSeedling =
    g
        []
        [ viewSun
        , viewPlant
        ]


viewSun : Svg Msg
viewSun =
    let
        style =
            [ fill paleGreen
            , strokeWidth <| px 0
            , seedlingAnimation "seedlingSunCycle"
            ]
    in
    styled g
        style
        []
        [ circle [ cx "29.420692", cy "25.374981", r "7.323606" ] []
        , viewSunHalo
        ]


viewSunHalo : Svg Msg
viewSunHalo =
    let
        style =
            [ seedlingAnimation "seedlingSunHaloCycle"
            ]

        pathData =
            "M 30.052734 11.990234 L 28.03125 15.779297 L 31.566406 16.03125 L 30.052734 11.990234 z M 23.890625 14.779297 A 1.3398552 1.3398552 0 0 0 22.550781 16.119141 A 1.3398552 1.3398552 0 0 0 23.890625 17.458984 A 1.3398552 1.3398552 0 0 0 25.230469 16.119141 A 1.3398552 1.3398552 0 0 0 23.890625 14.779297 z M 36.275391 14.976562 A 1.3398552 1.3398552 0 0 0 34.935547 16.316406 A 1.3398552 1.3398552 0 0 0 36.275391 17.65625 A 1.3398552 1.3398552 0 0 0 37.615234 16.316406 A 1.3398552 1.3398552 0 0 0 36.275391 14.976562 z M 16.541016 17.798828 L 18.5625 21.082031 L 20.455078 18.556641 L 16.541016 17.798828 z M 39.142578 20.703125 L 40.154297 24.238281 L 43.5625 20.830078 L 39.142578 20.703125 z M 18.455078 23.203125 A 1.3398552 1.3398552 0 0 0 17.115234 24.542969 A 1.3398552 1.3398552 0 0 0 18.455078 25.882812 A 1.3398552 1.3398552 0 0 0 19.794922 24.542969 A 1.3398552 1.3398552 0 0 0 18.455078 23.203125 z M 40.15625 26.876953 A 1.3398552 1.3398552 0 0 0 38.816406 28.216797 A 1.3398552 1.3398552 0 0 0 40.15625 29.556641 A 1.3398552 1.3398552 0 0 0 41.496094 28.216797 A 1.3398552 1.3398552 0 0 0 40.15625 26.876953 z M 18.435547 28.40625 L 15.783203 31.941406 L 20.582031 31.056641 L 18.435547 28.40625 z M 38.763672 31.814453 L 36.365234 33.960938 L 40.912109 36.613281 L 38.763672 31.814453 z M 22.230469 33.21875 A 1.3398552 1.3398552 0 0 0 20.890625 34.558594 A 1.3398552 1.3398552 0 0 0 22.230469 35.898438 A 1.3398552 1.3398552 0 0 0 23.570312 34.558594 A 1.3398552 1.3398552 0 0 0 22.230469 33.21875 z M 33.480469 35 A 1.3398552 1.3398552 0 0 0 32.140625 36.339844 A 1.3398552 1.3398552 0 0 0 33.480469 37.679688 A 1.3398552 1.3398552 0 0 0 34.820312 36.339844 A 1.3398552 1.3398552 0 0 0 33.480469 35 z M 25.884766 35.603516 L 26.894531 39.517578 L 29.546875 35.728516 L 25.884766 35.603516 z"
    in
    styled path
        style
        [ d pathData
        ]
        []


viewPlant : Svg Msg
viewPlant =
    let
        style =
            [ seedlingAnimation "seedlingPlantCycle"
            ]

        pathData =
            "m 60.628791,63.558752 c 0.759716,0.814851 -8.176942,-12.378923 -1.963956,-19.967403 4.1186,-5.030418 3.674327,-10.940739 0.791048,-12.5847"
    in
    styled g
        style
        []
        [ path [ d pathData ] []
        , viewPlantLeaf True ( 59.5, 31 ) 0.12 -60 True
        , viewPlantLeaf False ( 59.5, 31 ) 0.13 -85 True
        , viewPlantLeaf True ( 57, 47 ) 0.14 -70 False
        , viewPlantLeaf False ( 59, 59 ) 0.15 -80 False
        ]


viewPlantLeaf : Bool -> ( Float, Float ) -> Float -> Float -> Bool -> Svg Msg
viewPlantLeaf flipX ( attachX, attachY ) leafScale degrees growFast =
    let
        ( leafStalkX, leafStalkY ) =
            leafStalkPoint

        style =
            [ fill paleGreen
            , strokeWidth <| px 0
            , seedlingAnimation <|
                String.concat
                    [ "seedlingPlantLeaf"
                    , if growFast then
                        "Fast"

                      else
                        "Slow"
                    , "Cycle"
                    ]
            ]
    in
    g
        [ transform
            [ translate attachX attachY
            , flipAxes flipX False
            , rotate degrees ( 0, 0 )
            ]
        ]
        [ styled g
            style
            []
            [ path
                [ d leafPathData
                , transform
                    [ scale leafScale
                    , translate -leafStalkX -leafStalkY
                    ]
                ]
                []
            ]
        ]
