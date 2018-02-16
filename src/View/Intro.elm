module View.Intro exposing (viewIntro)

import Css exposing (fontSize, fontWeight, height, normal, pct, vh)
import Html.Styled exposing (Html, a, div, em, h1, p, span, strong, text)
import Html.Styled.Attributes exposing (css, href)
import Msg exposing (Msg)


viewIntro : Html Msg
viewIntro =
    div
        [ css [ height (vh 100) ] ]
        [ h1 [ css [ fontWeight normal ] ] [ text "Dan Cecile" ]
        , p [] [ em [] [ text "Software developer generalist" ] ]
        , p [] [ text "10 years of experience learning new tech, writing code, and improving systems." ]
        , p [] [ strong [] [ text "How can I help your team grow?" ] ]
        , a
            [ href "https://github.com/dcecile" ]
            [ text "GitHub" ]
        , p [ css [ fontSize <| pct 60 ] ] [ text "C#, C++, SQL, Ruby, Rails, Python, JavaScript, CSS, React" ]
        , p [ css [ fontSize <| pct 60 ] ] [ text "Unitron (2009): Implemented manufacturing tests to support new products, in C#" ]
        ]
