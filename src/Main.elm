module Main exposing (..)

import Css exposing (block, display, height, property, vh, width)
import Html exposing (program)
import Html.Styled exposing (Html, a, div, h1, text, toUnstyled)
import Html.Styled.Attributes exposing (href)
import Svg.Styled exposing (Attribute, Svg, g, path, svg)
import Svg.Styled.Attributes exposing (css, d, fill, stroke, transform, viewBox)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


type alias SvgTag msg =
    List (Attribute msg) -> List (Svg msg) -> Svg msg


viewRotate : SvgTag Msg -> ( String, String ) -> SvgTag Msg
viewRotate tag ( originX, originY ) attributes children =
    g
        [ transform <| "translate(" ++ originX ++ " " ++ originY ++ ")" ]
        [ g
            [ css [ property "animation" "rotate 1000ms linear infinite" ] ]
            [ g
                [ transform <| "translate(-" ++ originX ++ " -" ++ originY ++ ")" ]
                [ tag attributes children ]
            ]
        ]


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


viewSvg : Svg Msg
viewSvg =
    svg
        [ viewBox "0 0 300 300"
        , css
            [ display block
            , width <| vh 100
            , height <| vh 100
            ]
        ]
        [ viewPath1, viewPath2 ]


view : Model -> Html Msg
view model =
    div
        []
        [ h1 [] [ text "Dan Cecile" ]
        , a
            [ href "https://github.com/dcecile" ]
            [ text "GitHub" ]
        , viewSvg
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    program
        { view = view >> toUnstyled
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
