module CssShorthand
    exposing
        ( animation
        , batchMap
        , beforeText
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
        , mediaNotPrint
        , mediaPrint
        , noStyle
        , paddingRightLeft
        , paddingTopBottom
        , textDecorationSkipInk
        , transformOrigin
        , willChangeTransform
        , wordBreakBreakAll
        , zIndexBackground
        , zIndexNormal
        , zIndexOverlay
        )

import Css exposing (BorderStyle, Color, Length, LengthOrAuto, Style, TextDecorationStyle, batch, before, borderBottomStyle, borderColor, borderLeftStyle, borderStyle, borderTopStyle, column, displayFlex, flexDirection, int, marginBottom, marginLeft, marginRight, marginTop, paddingBottom, paddingLeft, paddingRight, paddingTop, property, row, rowReverse, solid, visited, zIndex)
import Css.Media exposing (print, withMedia)


animation : String -> Style
animation =
    property "animation"


batchMap : List (a -> Style) -> a -> Style
batchMap partialStyles styleParameter =
    List.map ((|>) styleParameter) partialStyles
        |> batch


beforeText : String -> List Style -> Style
beforeText text style =
    before
        [ property "content" ("'" ++ text ++ "'")
        , batch style
        ]


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


mediaNotPrint : List Style -> Style
mediaNotPrint =
    withMedia [ Css.Media.not print [] ]


mediaPrint : List Style -> Style
mediaPrint =
    withMedia [ Css.Media.only print [] ]


noStyle : Style
noStyle =
    batch []


textDecorationSkipInk : Style
textDecorationSkipInk =
    property "text-decoration-skip" "ink"


transformOrigin : String -> Style
transformOrigin =
    property "transform-origin"


willChangeTransform : Style
willChangeTransform =
    property "will-change" "transform"


wordBreakBreakAll : Style
wordBreakBreakAll =
    property "word-break" "break-all"


zIndexBackground : Style
zIndexBackground =
    zIndex <| int -1


zIndexNormal : Style
zIndexNormal =
    zIndex <| int 0


zIndexOverlay : Style
zIndexOverlay =
    zIndex <| int 1
