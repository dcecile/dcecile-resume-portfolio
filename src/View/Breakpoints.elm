module View.Breakpoints
    exposing
        ( breakpointDetailsLarge
        , breakpointDetailsMediumHeight
        , breakpointDetailsMediumWidth
        , breakpointDetailsSmallWidth
        , breakpointPortfolioMedium
        , breakpointPortfolioTall
        , breakpointPortfolioTallRemLength
        , breakpointResumePreviewLarge
        , breakpointResumePreviewMedium
        , breakpointResumePreviewMediumLarge
        )

import Css exposing (Style)
import Css.Media as Media
import CssShorthand exposing (batchMap, mediaConditions, mediaInverseConditions, rem_)


breakpointDetailsSmallWidth : List Style -> Style
breakpointDetailsSmallWidth =
    mediaConditions
        [ Media.minWidth <| rem_ 33
        ]


breakpointDetailsMediumWidth : List Style -> Style
breakpointDetailsMediumWidth =
    mediaConditions
        [ Media.minWidth <| rem_ 69
        ]


breakpointDetailsMediumHeight : List Style -> Style
breakpointDetailsMediumHeight =
    mediaConditions
        [ Media.minHeight <| rem_ 37
        ]


breakpointDetailsLarge : List Style -> Style
breakpointDetailsLarge =
    mediaConditions
        [ Media.minWidth <| rem_ 78
        , Media.minHeight <| rem_ 43
        ]


breakpointPortfolioMedium : List Style -> Style
breakpointPortfolioMedium =
    mediaConditions
        [ Media.minWidth <| rem_ 40
        ]


breakpointPortfolioTallRemLength : Float
breakpointPortfolioTallRemLength =
    52


breakpointPortfolioTall : List Style -> Style
breakpointPortfolioTall =
    mediaConditions
        [ Media.minHeight <| rem_ breakpointPortfolioTallRemLength
        ]


breakpointResumePreviewMediumRemLength : Float
breakpointResumePreviewMediumRemLength =
    45


breakpointResumePreviewMedium : List Style -> Style
breakpointResumePreviewMedium =
    mediaConditions
        [ Media.minWidth <| rem_ breakpointResumePreviewMediumRemLength
        , Media.maxWidth <| rem_ breakpointResumePreviewLargeRemLength
        ]


breakpointResumePreviewLargeRemLength : Float
breakpointResumePreviewLargeRemLength =
    77


breakpointResumePreviewLarge : List Style -> Style
breakpointResumePreviewLarge =
    mediaInverseConditions
        [ Media.maxWidth <| rem_ breakpointResumePreviewLargeRemLength
        ]


breakpointResumePreviewMediumLarge : List Style -> Style
breakpointResumePreviewMediumLarge =
    mediaConditions
        [ Media.minWidth <| rem_ breakpointResumePreviewMediumRemLength
        ]
