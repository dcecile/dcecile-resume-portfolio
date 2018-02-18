module View.Graphic
    exposing
        ( viewGraphic
        )

import Css exposing (block, display, height, vh, width)
import CssShorthand exposing (animation)
import Msg exposing (Msg)
import Svg.Styled exposing (Attribute, Svg, g, path, svg)
import Svg.Styled.Attributes exposing (css, d, fill, stroke, transform, viewBox)


type alias SvgTag msg =
    List (Attribute msg) -> List (Svg msg) -> Svg msg


viewGraphic : Svg Msg
viewGraphic =
    svg
        [ viewBox "0 0 300 300"
        , css
            [ display block
            , width <| vh 100
            , height <| vh 100
            ]
        ]
        [ viewPath1, viewPath2 ]


viewPath1 : Svg Msg
viewPath1 =
    viewRotate
        path
        ( "150", "150" )
        [ d "M 0,150 A 150,150 0 1,1 150,300"
        , fill "none"
        , stroke "black"
        ]
        []


viewPath2 : Svg Msg
viewPath2 =
    viewRotate
        path
        ( "200", "100" )
        [ d "M 150,100 A 50,50 0 1,1 200,150"
        , fill "none"
        , stroke "red"
        ]
        []


viewRotate : SvgTag Msg -> ( String, String ) -> SvgTag Msg
viewRotate tag ( originX, originY ) attributes children =
    g
        [ transform <| "translate(" ++ originX ++ " " ++ originY ++ ")" ]
        [ g
            [ css [ animation "rotate 1000ms linear infinite" ] ]
            [ g
                [ transform <| "translate(-" ++ originX ++ " -" ++ originY ++ ")" ]
                [ tag attributes children ]
            ]
        ]
