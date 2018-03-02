module Icon
    exposing
        ( IconBackground
        , IconSource
        , iconImage
        , iconSpan
        , iconStyle
        )

import Css exposing (LengthOrAuto, Style, backgroundImage, backgroundOrigin, backgroundPosition, backgroundRepeat, backgroundSize, batch, center, contain, contentBox, height, noRepeat, num, opacity, px, url, width)
import CssShorthand exposing (batchMap, marginRightLeft)
import Html.Styled exposing (Attribute, Html, img, span, styled)
import Html.Styled.Attributes exposing (src)
import View.Colors exposing (blackLevel)


type alias IconSource =
    { box : String
    , calendar : String
    , externalLink : String
    , eye : String
    , fiveHundredPx : String
    , github : String
    , heart : String
    , linkedin : String
    , mail : String
    , mapPin : String
    , printer : String
    , stackOverflow : String
    , twitter : String
    }


type alias IconBackground =
    IconSource -> String


iconSpan : LengthOrAuto compatible -> IconSource -> IconBackground -> Html msg
iconSpan marginLength iconSource iconBackground =
    let
        style =
            [ iconStyle iconSource iconBackground
            , batchMap [ width, height ] <| px 24
            , marginRightLeft marginLength
            , opacity <| num (1 - toFloat blackLevel / 255)
            ]
    in
    styled span style [] []


iconStyle : IconSource -> IconBackground -> Style
iconStyle iconSource iconBackground =
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
