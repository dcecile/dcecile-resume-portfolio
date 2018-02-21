module SvgShorthand
    exposing
        ( SvgTag
        , fill
        , rotate
        , scale
        , stroke
        , strokeWidthUnscaled
        , transform
        , translate
        , viewBoxSquare
        )

import Css exposing (Color, ExplicitLength, Style, Value, property)
import Html.Styled.Attributes exposing (attribute)
import Svg.Styled exposing (Attribute, Svg)


type alias SvgTag msg =
    List (Attribute msg) -> List (Svg msg) -> Svg msg


valueProperty : String -> Value a -> Style
valueProperty name =
    property name << .value


fill : Color -> Style
fill =
    valueProperty "fill"


stroke : Color -> Style
stroke =
    valueProperty "stroke"


strokeWidth : ExplicitLength units -> Style
strokeWidth =
    valueProperty "stroke-width"


strokeWidthUnscaled : ExplicitLength units -> Float -> Style
strokeWidthUnscaled length scale =
    strokeWidth
        { length
            | value =
                toString (length.numericValue / scale)
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


rotate : Float -> Transform
rotate degrees =
    Transform "rotate" [ degrees ]


scale : Float -> Transform
scale size =
    Transform "scale" [ size ]


translate : Float -> Float -> Transform
translate x y =
    Transform "translate" [ x, y ]


transformToString : Transform -> String
transformToString { name, values } =
    String.concat
        [ name
        , "("
        , values |> List.map toString |> String.join ","
        , ")"
        ]


viewBox : ( Float, Float ) -> ( Float, Float ) -> Attribute msg
viewBox ( minX, minY ) ( width, height ) =
    [ minX, minY, width, height ]
        |> List.map toString
        |> String.join " "
        |> attribute "viewBox"


viewBoxRect : Float -> Float -> Attribute msg
viewBoxRect width height =
    viewBox ( 0, 0 ) ( width, height )


viewBoxSquare : Float -> Attribute msg
viewBoxSquare size =
    viewBoxRect size size
