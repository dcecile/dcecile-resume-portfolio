module View.ElmLogo exposing (viewElmLogo)

import Css exposing (em, marginBottom, marginLeft)
import CssShorthand exposing (batchMap)
import Svg.Styled exposing (Svg, g, polygon, styled, svg)
import Svg.Styled.Attributes exposing (fill, points, transform, viewBox)


viewElmLogo : Svg msg
viewElmLogo =
    let
        style =
            [ batchMap [ Css.width, Css.height ] <| em 0.9
            , marginBottom <| em -0.1
            , marginLeft <| em 0.1
            ]
    in
    styled svg
        style
        [ viewBox "-300 -300 600 600"
        ]
        [ g [ transform "scale(1 -1)" ]
            [ polygon [ fill "rgba(18, 147, 216, 1)", points "-280,-90 0,190 280,-90", transform "translate(0 -210) rotate(0)" ] []
            , polygon [ fill "rgba(18, 147, 216, 1)", points "-280,-90 0,190 280,-90", transform "translate(-210 0) rotate(-90)" ] []
            , polygon [ fill "rgba(18, 147, 216, 0.75)", points "-198,-66 0,132 198,-66", transform "translate(207 207) rotate(-45)" ] []
            , polygon [ fill "rgba(18, 147, 216, 1)", points "-130,0 0,-130 130,0 0,130", transform "translate(150 0) rotate(0)" ] []
            , polygon [ fill "rgba(18, 147, 216, 0.75)", points "-191,61 69,61 191,-61 -69,-61", transform "translate(-89 239) rotate(0)" ] []
            , polygon [ fill "rgba(18, 147, 216, 0.75)", points "-130,-44 0,86  130,-44", transform "translate(0 106) rotate(-180)" ] []
            , polygon [ fill "rgba(18, 147, 216, 0.75)", points "-130,-44 0,86  130,-44", transform "translate(256 -150) rotate(-270)" ] []
            ]
        ]
