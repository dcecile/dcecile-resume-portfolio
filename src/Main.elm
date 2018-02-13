module Main exposing (..)

import Css exposing (block, borderBox, boxSizing, column, display, displayFlex, flexDirection, height, inches, justifyContent, minHeight, none, padding2, property, spaceBetween, vh, width)
import Css.Media exposing (only, print, screen, withMedia)
import Html exposing (program)
import Html.Styled exposing (Html, a, div, h1, h2, text, toUnstyled)
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


viewUi : Html Msg
viewUi =
    div
        [ css
            [ display none
            , withMedia
                [ only screen [] ]
                [ display block ]
            ]
        ]
        [ h1 [] [ text "Dan Cecile" ]
        , a
            [ href "https://github.com/dcecile" ]
            [ text "GitHub" ]
        , viewSvg
        ]


viewPrintHeader : Html Msg
viewPrintHeader =
    div
        []
        [ h1 [] [ text "Dan Cecile" ]
        , h2 [] [ text "Software developer (10 years experience)" ]
        , a
            [ href "https://github.com/dcecile" ]
            [ text "GitHub: https://github.com/dcecile" ]
        ]


viewPrintFooter : Html Msg
viewPrintFooter =
    div
        []
        [ a
            [ href "https://github.com/dcecile" ]
            [ text "Made with Elm (https://github.com/dcecile/dcecile-resume-portfolio)" ]
        ]


viewPrint : Html Msg
viewPrint =
    div
        [ css
            [ display none
            , flexDirection column
            , justifyContent spaceBetween
            , minHeight (vh 100)
            , padding2 (inches 1) (inches 1)
            , boxSizing borderBox
            , withMedia
                [ only print [] ]
                [ displayFlex ]
            ]
        ]
        [ viewPrintHeader
        , viewPrintFooter
        ]


view : Model -> Html Msg
view model =
    div
        []
        [ viewUi
        , viewPrint
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
