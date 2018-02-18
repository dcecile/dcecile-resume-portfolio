module View.Print
    exposing
        ( viewPrint
        )

import Css exposing (borderBox, boxSizing, column, display, displayFlex, flexDirection, height, inches, justifyContent, minHeight, none, padding2, spaceBetween, vh)
import Css.Media exposing (only, print, screen, withMedia)
import CssShorthand exposing (displayFlexColumn)
import Html.Styled exposing (Html, a, div, h1, h2, text)
import Html.Styled.Attributes exposing (css, href)
import Msg exposing (Msg)


viewPrint : Html Msg
viewPrint =
    div
        [ css
            [ display none
            , justifyContent spaceBetween
            , minHeight (vh 100)
            , padding2 (inches 1) (inches 1)
            , boxSizing borderBox
            , withMedia
                [ only print [] ]
                [ displayFlexColumn ]
            ]
        ]
        [ viewHeader
        , viewFooter
        ]


viewHeader : Html Msg
viewHeader =
    div
        []
        [ h1 [] [ text "Dan Cecile" ]
        , h2 [] [ text "Software developer (10 years experience)" ]
        , a
            [ href "https://github.com/dcecile" ]
            [ text "GitHub: https://github.com/dcecile" ]
        ]


viewFooter : Html Msg
viewFooter =
    div
        []
        [ a
            [ href "https://github.com/dcecile" ]
            [ text "Made with Elm (https://github.com/dcecile/dcecile-resume-portfolio)" ]
        ]
