module Icon exposing
    ( IconBackground
    , IconSource
    , iconBackgroundImage
    , iconImage
    , iconSpan
    )

import Css exposing (LengthOrAuto, Style, backgroundImage, backgroundOrigin, backgroundPosition, backgroundRepeat, backgroundSize, batch, center, contain, contentBox, display, height, inlineBlock, noRepeat, num, opacity, px, url, width)
import CssShorthand exposing (batchMap, marginRightLeft)
import Html.Styled exposing (Attribute, Html, img, span, styled)
import Html.Styled.Attributes exposing (src)
import View.Colors exposing (blackLevel)


type alias IconSource =
    { box : String
    , calendar : String
    , chevronLeft : String
    , chevronRight : String
    , download : String
    , externalLink : String
    , eye : String
    , fiveHundredPx : String
    , github : String
    , heart : String
    , home : String
    , linkedin : String
    , mail : String
    , mapPin : String
    , printer : String
    , stackOverflow : String
    , twitter : String
    , user : String
    , xSquare : String
    }


type alias IconBackground =
    IconSource -> String


iconSpan : List Style -> IconSource -> IconBackground -> Html msg
iconSpan customStyle iconSource iconBackground =
    let
        style =
            [ iconBackgroundImage iconSource iconBackground
            , display inlineBlock
            , batchMap [ width, height ] <| px 24
            , opacity <| num (1 - toFloat blackLevel / 255)
            , batch customStyle
            ]
    in
    styled span style [] []


iconBackgroundImage : IconSource -> IconBackground -> Style
iconBackgroundImage iconSource iconBackground =
    batch
        [ backgroundImage <| url (iconBackground iconSource)
        , backgroundRepeat noRepeat
        , backgroundPosition center
        , backgroundSize contain
        , backgroundOrigin contentBox
        ]


iconImage : IconSource -> IconBackground -> Attribute msg
iconImage iconSource iconBackground =
    src <| iconBackground iconSource
