module View.Breakpoints
    exposing
        ( breakpointMedium
        )

import Css exposing (Style)
import CssShorthand exposing (mediaMinWidthRem)


breakpointMedium : List Style -> Style
breakpointMedium =
    mediaMinWidthRem 40
