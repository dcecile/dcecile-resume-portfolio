module CssShorthand
    exposing
        ( animation
        , batchMap
        , borderRightLeftWidth
        , borderSolidColor
        , borderTopBottomWidth
        , displayFlexColumn
        , displayFlexRow
        , displayFlexRowReverse
        , marginRightLeft
        , marginTopBottom
        , paddingRightLeft
        , paddingTopBottom
        )

import Css exposing (Color, Length, LengthOrAuto, Style, batch, borderBottomWidth, borderColor, borderLeftWidth, borderRightWidth, borderStyle, borderTopWidth, column, displayFlex, flexDirection, marginBottom, marginLeft, marginRight, marginTop, paddingBottom, paddingLeft, paddingRight, paddingTop, property, row, rowReverse, solid)


animation : String -> Style
animation =
    property "animation"


borderRightLeftWidth : Length compatible units -> Style
borderRightLeftWidth =
    batchMap [ borderRightWidth, borderLeftWidth ]


borderSolidColor : Color -> Style
borderSolidColor color =
    batch [ borderStyle solid, borderColor color ]


borderTopBottomWidth : Length compatible units -> Style
borderTopBottomWidth =
    batchMap [ borderTopWidth, borderBottomWidth ]


displayFlexColumn : Style
displayFlexColumn =
    batch [ displayFlex, flexDirection column ]


displayFlexRow : Style
displayFlexRow =
    batch [ displayFlex, flexDirection row ]


displayFlexRowReverse : Style
displayFlexRowReverse =
    batch [ displayFlex, flexDirection rowReverse ]


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


batchMap : List (a -> Style) -> a -> Style
batchMap partialStyles styleParameter =
    List.map ((|>) styleParameter) partialStyles
        |> batch
