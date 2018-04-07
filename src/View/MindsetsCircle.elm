module View.MindsetsCircle
    exposing
        ( viewMindsetsCircle
        )

import Css exposing (Style, batch, px, transparent)
import Msg exposing (Msg)
import Svg.Styled exposing (Svg, circle, clipPath, g, styled, svg)
import Svg.Styled.Attributes as SvgAttributes exposing (cx, cy, id, r)
import SvgShorthand exposing (fill, stroke, strokeWidth, viewBoxSquare)
import View.Colors exposing (paleGreen)


viewMindsetsCircle : List Style -> Svg Msg -> Svg Msg
viewMindsetsCircle customStyle illustration =
    let
        style =
            [ stroke paleGreen
            , fill transparent
            , strokeWidth <| px 1
            , batch customStyle
            ]
    in
    styled svg
        style
        [ viewBoxSquare 100 ]
        [ circle [ cx "50", cy "50", r "45" ] []
        , clipPath
            [ id "clip" ]
            [ circle [ cx "50", cy "50", r "42" ] [] ]
        , g
            [ SvgAttributes.clipPath "url(#clip)" ]
            [ illustration ]
        ]
