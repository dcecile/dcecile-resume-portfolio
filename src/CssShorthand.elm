module CssShorthand
    exposing
        ( animation
        , batchMap
        , displayFlexColumn
        , displayFlexRow
        , displayFlexRowReverse
        , marginRightLeft
        , paddingRightLeft
        , paddingTopBottom
        )

import Css exposing (Length, LengthOrAuto, Style, batch, column, displayFlex, flexDirection, marginLeft, marginRight, paddingBottom, paddingLeft, paddingRight, paddingTop, property, row, rowReverse)


animation : String -> Style
animation =
    property "animation"


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


batchMap : List (a -> Style) -> a -> Style
batchMap partialStyles styleParameter =
    List.map ((|>) styleParameter) partialStyles
        |> batch
