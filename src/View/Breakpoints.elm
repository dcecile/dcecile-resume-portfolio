module View.Breakpoints
    exposing
        ( breakpointMedium
        , breakpointTall
        , breakpointTallRemLength
        )

import Css exposing (Style)
import CssShorthand exposing (mediaMinHeightRem, mediaMinWidthRem)


breakpointMedium : List Style -> Style
breakpointMedium =
    mediaMinWidthRem 40


breakpointTallRemLength : Float
breakpointTallRemLength =
    52


breakpointTall : List Style -> Style
breakpointTall =
    mediaMinHeightRem breakpointTallRemLength
