module View.Resume
    exposing
        ( viewResume
        )

import Css exposing (color, em, flexGrow, justifyContent, num, padding2, spaceBetween)
import CssShorthand exposing (displayFlexColumn)
import Html.Styled exposing (Html, a, div, h1, h2, styled, text)
import Html.Styled.Attributes exposing (href)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Colors exposing (printBlack)


viewResume : Model -> Html Msg
viewResume model =
    let
        basicData =
            model.data.basic

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
        [ viewHeader basicData.name
        , viewFooter basicData.sourceURL
        ]


viewHeader : String -> Html Msg
viewHeader name =
    div
        []
        [ h1 [] [ text name ]
        , h2 [] [ text "Software developer (10 years experience)" ]
        , a
            [ href "https://github.com/dcecile" ]
            [ text "GitHub: https://github.com/dcecile" ]
        ]


viewFooter : String -> Html Msg
viewFooter sourceURL =
    div
        []
        [ a
            [ href sourceURL ]
            [ text <| "Made with Elm (" ++ sourceURL ++ ")" ]
        ]
