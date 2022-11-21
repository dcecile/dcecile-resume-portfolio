module SvgShorthand exposing
    ( SvgTag
    , fill
    , flipAxes
    , rotate
    , scale
    , stroke
    , strokeWidth
    , strokeWidthUnscaled
    , transform
    , translate
    , viewBoxSquare
    )

import Css exposing (ColorValue, ExplicitLength, Style, Value, property)
import Html.Styled.Attributes exposing (attribute)
import Svg.Styled exposing (Attribute, Svg)


type alias SvgTag msg =
    List (Attribute msg) -> List (Svg msg) -> Svg msg


valueProperty : String -> Value a -> Style
valueProperty name =
    property name << .value


fill : ColorValue compatible -> Style
fill =
    valueProperty "fill"


stroke : ColorValue compatible -> Style
stroke =
    valueProperty "stroke"


strokeWidth : ExplicitLength units -> Style
strokeWidth =
    valueProperty "stroke-width"


strokeWidthUnscaled : ExplicitLength units -> Float -> Style
strokeWidthUnscaled length scaleBy =
    strokeWidth
        { length
            | value =
                String.fromFloat (length.numericValue / scaleBy)
                    ++ length.unitLabel
        }


type alias Transform =
    { name : String
    , values : List Float
    }


transform : List Transform -> Attribute msg
transform =
    List.map transformToString
        >> String.join " "
        >> attribute "transform"


rotate : Float -> ( Float, Float ) -> Transform
rotate degrees ( centerX, centerY ) =
    Transform "rotate" [ degrees, centerX, centerY ]


scale : Float -> Transform
scale size =
    Transform "scale" [ size ]


flipAxes : Bool -> Bool -> Transform
flipAxes flipX flipY =
    Transform "scale"
        [ if flipX then
            -1

          else
            1
        , if flipY then
            -1

          else
            1
        ]


translate : Float -> Float -> Transform
translate x y =
    Transform "translate" [ x, y ]


transformToString : Transform -> String
transformToString { name, values } =
    String.concat
        [ name
        , "("
        , values |> List.map String.fromFloat |> String.join ","
        , ")"
        ]


viewBox : ( Float, Float ) -> ( Float, Float ) -> Attribute msg
viewBox ( minX, minY ) ( width, height ) =
    [ minX, minY, width, height ]
        |> List.map String.fromFloat
        |> String.join " "
        |> attribute "viewBox"


viewBoxRect : Float -> Float -> Attribute msg
viewBoxRect width height =
    viewBox ( 0, 0 ) ( width, height )


viewBoxSquare : Float -> Attribute msg
viewBoxSquare size =
    viewBoxRect size size
