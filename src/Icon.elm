module Icon
    exposing
        ( IconBackground
        , IconSource
        , iconSpan
        , iconStyle
        )

import Css exposing (LengthOrAuto, Style, backgroundImage, backgroundOrigin, backgroundPosition, backgroundRepeat, backgroundSize, batch, center, contain, contentBox, height, noRepeat, num, opacity, px, url, width)
import CssShorthand exposing (marginRightLeft)
import Html.Styled exposing (Html, span, styled)
import View.Colors exposing (blackLevel)


type alias IconSource =
    { box : String
    , calendar : String
    , eye : String
    , fiveHundredPx : String
    , github : String
    , heart : String
    , linkedin : String
    , mail : String
    , printer : String
    , stackOverflow : String
    , twitter : String
    }


type alias IconBackground =
    IconSource -> String


iconSpan : LengthOrAuto compatible -> IconSource -> IconBackground -> Html msg
iconSpan marginLength iconSource iconBackground =
    let
        iconSize =
            px 24

        style =
            [ iconStyle iconSource iconBackground
            , width iconSize
            , height iconSize
            , marginRightLeft marginLength
            , opacity <| num (1 - toFloat blackLevel / 255)
            ]
    in
    styled span
        style
        []
        []


iconStyle : IconSource -> IconBackground -> Style
iconStyle iconSource iconBackground =
    batch
        [ backgroundImage <| url (iconBackground iconSource)
        , backgroundRepeat noRepeat
        , backgroundPosition center
        , backgroundSize contain
        , backgroundOrigin contentBox
        ]
