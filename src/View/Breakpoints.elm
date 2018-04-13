module View.Breakpoints
    exposing
        ( breakpointMedium
        , breakpointResumePreviewLarge
        , breakpointResumePreviewMedium
        , breakpointResumePreviewMediumLarge
        , breakpointTall
        , breakpointTallRemLength
        )

import Css exposing (Style)
import CssShorthand exposing (batchMap, mediaMinHeightRem, mediaMinWidthRem, mediaMinWidthRemTo)


breakpointMedium : List Style -> Style
breakpointMedium =
    mediaMinWidthRem 40


breakpointTallRemLength : Float
breakpointTallRemLength =
    52


breakpointTall : List Style -> Style
breakpointTall =
    mediaMinHeightRem breakpointTallRemLength


breakpointResumePreviewMedium : List Style -> Style
breakpointResumePreviewMedium =
    mediaMinWidthRemTo 45 77


breakpointResumePreviewLarge : List Style -> Style
breakpointResumePreviewLarge =
    mediaMinWidthRem 77


breakpointResumePreviewMediumLarge : List Style -> Style
breakpointResumePreviewMediumLarge =
    batchMap [ breakpointResumePreviewMedium, breakpointResumePreviewLarge ]
