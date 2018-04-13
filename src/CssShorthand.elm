module CssShorthand
    exposing
        ( afterText
        , animation
        , animationCycle
        , batchMap
        , beforeText
        , borderBottomSolidColor
        , borderLeftSolidColor
        , borderSolidColor
        , borderTopBottomSolidColor
        , displayFlexColumn
        , displayFlexRow
        , displayFlexRowReverse
        , displayNone
        , filter
        , marginRightLeft
        , marginTopBottom
        , mediaMinWidthRem
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

import Css exposing (BorderStyle, Color, Length, LengthOrAuto, Style, TextDecorationStyle, after, batch, before, borderBottomStyle, borderColor, borderLeftStyle, borderStyle, borderTopStyle, column, display, displayFlex, flexDirection, int, marginBottom, marginLeft, marginRight, marginTop, none, paddingBottom, paddingLeft, paddingRight, paddingTop, property, row, rowReverse, solid, visited, zIndex)
import Css.Media as Media exposing (withMedia)


afterText : String -> List Style -> Style
afterText =
    pseudoElementContentText after


animation : String -> Style
animation =
    property "animation"


animationCycle : Float -> String -> Style
animationCycle durationMilliseconds name =
    animation <|
        String.join " "
            [ name
            , toString durationMilliseconds ++ "ms"
            , "infinite"
            , "both"
            ]


batchMap : List (a -> Style) -> a -> Style
batchMap partialStyles styleParameter =
    List.map ((|>) styleParameter) partialStyles
        |> batch


beforeText : String -> List Style -> Style
beforeText =
    pseudoElementContentText before


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


displayNone : Style
displayNone =
    display none


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
    withMedia [ Media.not Media.print [] ]


mediaPrint : List Style -> Style
mediaPrint =
    withMedia [ Media.only Media.print [] ]


mediaMinWidthRem : Float -> List Style -> Style
mediaMinWidthRem length =
    withMedia [ Media.all [ Media.minWidth (Css.rem length) ] ]


noStyle : Style
noStyle =
    batch []


pseudoElementContentText : (List Style -> Style) -> String -> List Style -> Style
pseudoElementContentText pseudoElement text style =
    pseudoElement
        [ property "content" ("'" ++ text ++ "'")
        , batch style
        ]


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
