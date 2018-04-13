module View.Breakpoints
    exposing
        ( breakpointPortfolioMedium
        , breakpointPortfolioTall
        , breakpointPortfolioTallRemLength
        , breakpointResumePreviewLarge
        , breakpointResumePreviewMedium
        , breakpointResumePreviewMediumLarge
        )

import Css exposing (Style)
import CssShorthand exposing (batchMap, mediaMinHeightRem, mediaMinWidthRem, mediaMinWidthRemTo)


breakpointPortfolioMedium : List Style -> Style
breakpointPortfolioMedium =
    mediaMinWidthRem 40


breakpointPortfolioTallRemLength : Float
breakpointPortfolioTallRemLength =
    52


breakpointPortfolioTall : List Style -> Style
breakpointPortfolioTall =
    mediaMinHeightRem breakpointPortfolioTallRemLength


breakpointResumePreviewMedium : List Style -> Style
breakpointResumePreviewMedium =
    mediaMinWidthRemTo 45 77


breakpointResumePreviewLarge : List Style -> Style
breakpointResumePreviewLarge =
    mediaMinWidthRem 77


breakpointResumePreviewMediumLarge : List Style -> Style
breakpointResumePreviewMediumLarge =
    batchMap [ breakpointResumePreviewMedium, breakpointResumePreviewLarge ]
