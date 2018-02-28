module CssShorthand
    exposing
        ( animation
        , batchMap
        , borderBottomSolidColor
        , borderLeftSolidColor
        , borderSolidColor
        , borderTopBottomSolidColor
        , displayFlexColumn
        , displayFlexRow
        , displayFlexRowReverse
        , filter
        , marginRightLeft
        , marginTopBottom
        , noStyle
        , paddingRightLeft
        , paddingTopBottom
        , textDecorationSkipInk
        , willChangeTransform
        , zIndexBackground
        )

import Css exposing (BorderStyle, Color, Length, LengthOrAuto, Style, TextDecorationStyle, batch, borderBottomStyle, borderColor, borderLeftStyle, borderStyle, borderTopStyle, column, displayFlex, flexDirection, int, marginBottom, marginLeft, marginRight, marginTop, paddingBottom, paddingLeft, paddingRight, paddingTop, property, row, rowReverse, solid, visited, zIndex)


animation : String -> Style
animation =
    property "animation"


batchMap : List (a -> Style) -> a -> Style
batchMap partialStyles styleParameter =
    List.map ((|>) styleParameter) partialStyles
        |> batch


borderBottomSolidColor : Color -> Style
borderBottomSolidColor =
    borderSidesSolidColor [ borderBottomStyle ]


borderLeftSolidColor : Color -> Style
borderLeftSolidColor =
    borderSidesSolidColor [ borderLeftStyle ]


borderSolidColor : Color -> Style
borderSolidColor =
    borderSidesSolidColor [ borderStyle ]


borderTopBottomSolidColor : Color -> Style
borderTopBottomSolidColor =
    borderSidesSolidColor [ borderTopStyle, borderBottomStyle ]


borderSidesSolidColor : List (BorderStyle (TextDecorationStyle {}) -> Style) -> Color -> Style
borderSidesSolidColor sides color =
    batch [ batchMap sides solid, borderColor color ]


displayFlexColumn : Style
displayFlexColumn =
    batch [ displayFlex, flexDirection column ]


displayFlexRow : Style
displayFlexRow =
    batch [ displayFlex, flexDirection row ]


displayFlexRowReverse : Style
displayFlexRowReverse =
    batch [ displayFlex, flexDirection rowReverse ]


filter : String -> Style
filter =
    property "filter"


paddingRightLeft : Length compatible units -> Style
paddingRightLeft =
    batchMap [ paddingRight, paddingLeft ]


paddingTopBottom : Length compatible units -> Style
paddingTopBottom =
    batchMap [ paddingTop, paddingBottom ]


marginRightLeft : LengthOrAuto compatible -> Style
marginRightLeft =
    batchMap [ marginRight, marginLeft ]


marginTopBottom : LengthOrAuto compatible -> Style
marginTopBottom =
    batchMap [ marginTop, marginBottom ]


noStyle : Style
noStyle =
    batch []


textDecorationSkipInk : Style
textDecorationSkipInk =
    property "text-decoration-skip" "ink"


willChangeTransform : Style
willChangeTransform =
    property "will-change" "transform"


zIndexBackground : Style
zIndexBackground =
    zIndex <| int -1
