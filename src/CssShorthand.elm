module CssShorthand
    exposing
        ( animation
        , displayFlexColumn
        , displayFlexRow
        , marginRightLeft
        , marginTopBottom
        )

import Css exposing (LengthOrAuto, Style, batch, column, displayFlex, flexDirection, marginBottom, marginLeft, marginRight, marginTop, property, row)


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


marginRightLeft : LengthOrAuto compatible -> Style
marginRightLeft lengthOrAuto =
    batch
        [ marginRight lengthOrAuto
        , marginLeft lengthOrAuto
        ]


marginTopBottom : LengthOrAuto compatible -> Style
marginTopBottom lengthOrAuto =
    batch
        [ marginTop lengthOrAuto
        , marginBottom lengthOrAuto
        ]
