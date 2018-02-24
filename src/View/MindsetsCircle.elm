module View.MindsetsCircle
    exposing
        ( viewMindsetsCircle
        )

import Css exposing (Style, batch, px, transparent)
import Msg exposing (Msg)
import Svg.Styled exposing (Svg, circle, styled, svg)
import Svg.Styled.Attributes exposing (cx, cy, r)
import SvgShorthand exposing (fill, stroke, strokeWidth, viewBoxSquare)
import View.Colors exposing (paleGreen)


viewMindsetsCircle : List Style -> Svg Msg
viewMindsetsCircle outerStyle =
    let
        style =
            [ batch outerStyle
            , stroke paleGreen
            , fill transparent
            , strokeWidth <| px 1
            ]
    in
    styled svg
        style
        [ viewBoxSquare 100
        ]
        [ circle [ cx "50", cy "50", r "45" ] []
        ]
