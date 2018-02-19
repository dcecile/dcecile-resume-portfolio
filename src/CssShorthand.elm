module CssShorthand
    exposing
        ( animation
        , displayFlexColumn
        , displayFlexRow
        , marginRightLeft
        , marginTopBottom
        , paddingRightLeft
        )

import Css exposing (Length, LengthOrAuto, Style, batch, column, displayFlex, flexDirection, marginBottom, marginLeft, marginRight, marginTop, paddingLeft, paddingRight, property, row)


animation : String -> Style
animation =
    property "animation"


displayFlexColumn : Style
displayFlexColumn =
    batch
        [ displayFlex
        , flexDirection column
        ]


displayFlexRow : Style
displayFlexRow =
    batch
        [ displayFlex
        , flexDirection row
        ]


paddingRightLeft : Length compatible units -> Style
paddingRightLeft =
    batchMap [ paddingRight, paddingLeft ]


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
