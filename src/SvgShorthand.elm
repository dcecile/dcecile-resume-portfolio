module SvgShorthand
    exposing
        ( SvgTag
        )

import Svg.Styled exposing (Attribute, Svg)


type alias SvgTag msg =
    List (Attribute msg) -> List (Svg msg) -> Svg msg
