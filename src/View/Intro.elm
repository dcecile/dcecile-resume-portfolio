module View.Intro exposing (viewIntro)

import Html.Styled exposing (Html, a, div, h1, text)
import Html.Styled.Attributes exposing (href)
import Msg exposing (Msg)


viewIntro : Html Msg
viewIntro =
    div
        []
        [ h1 [] [ text "Dan Cecile" ]
        , a
            [ href "https://github.com/dcecile" ]
            [ text "GitHub" ]
        ]
