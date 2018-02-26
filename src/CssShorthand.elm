module CssShorthand
    exposing
        ( animation
        , batchMap
        , borderBottomSolidColor
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
        , willChangeTransform
        , zIndexBackground
        )

import Css exposing (Color, Length, LengthOrAuto, Style, batch, borderBottomStyle, borderColor, borderStyle, borderTopStyle, column, displayFlex, flexDirection, int, marginBottom, marginLeft, marginRight, marginTop, paddingBottom, paddingLeft, paddingRight, paddingTop, property, row, rowReverse, solid, visited, zIndex)


animation : String -> Style
animation =
    property "animation"


borderBottomSolidColor : Color -> Style
borderBottomSolidColor color =
    batch [ borderBottomStyle solid, borderColor color ]


borderSolidColor : Color -> Style
borderSolidColor color =
    batch [ borderStyle solid, borderColor color ]


borderTopBottomSolidColor : Color -> Style
borderTopBottomSolidColor color =
    batch [ borderTopStyle solid, borderBottomStyle solid, borderColor color ]


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


batchMap : List (a -> Style) -> a -> Style
batchMap partialStyles styleParameter =
    List.map ((|>) styleParameter) partialStyles
        |> batch


willChangeTransform : Style
willChangeTransform =
    property "will-change" "transform"


zIndexBackground : Style
zIndexBackground =
    zIndex <| int -1
