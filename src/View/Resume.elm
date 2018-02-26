module View.Resume
    exposing
        ( viewResume
        )

import Css exposing (color, em, flexGrow, justifyContent, num, padding2, spaceBetween)
import CssShorthand exposing (displayFlexColumn)
import Html.Styled exposing (Html, a, div, h1, h2, styled, text)
import Html.Styled.Attributes exposing (href)
import Msg exposing (Msg)
import View.Colors exposing (printBlack)


viewResume : Html Msg
viewResume =
    let
        style =
            [ displayFlexColumn
            , justifyContent spaceBetween
            , padding2 (em 3) (em 3)
            , flexGrow <| num 1
            , color printBlack
            ]
    in
    styled div
        style
        []
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
