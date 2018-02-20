module CssShorthand
    exposing
        ( animation
        , displayFlexColumn
        , displayFlexRow
        , marginRightLeft
        , paddingRightLeft
        , paddingTopBottom
        )

import Css exposing (Length, LengthOrAuto, Style, batch, column, displayFlex, flexDirection, marginLeft, marginRight, paddingLeft, paddingRight, property, row, paddingTop, paddingBottom)


animation : String -> Style
animation =
    property "animation"


displayFlexColumn : Style
displayFlexColumn =
    batch [ displayFlex , flexDirection column ]


displayFlexRow : Style
displayFlexRow =
    batch [ displayFlex , flexDirection row ]


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
