module Icon
    exposing
        ( IconBackground
        , IconSource
        , boxBackground
        , calendarBackground
        , eyeBackground
        , fiveHundredPxBackground
        , githubBackground
        , heartBackground
        , iconSpan
        , linkedinBackground
        , mailBackground
        , printerBackground
        , stackOverflowBackground
        , twitterBackground
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
    IconSource -> Style


iconSpan : LengthOrAuto compatible -> IconSource -> IconBackground -> Html msg
iconSpan marginLength iconSource iconBackground =
    let
        iconSize =
            px 24

        style =
            [ iconBackground iconSource
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


iconBackground : (IconSource -> String) -> IconBackground
iconBackground iconSelector iconSource =
    batch
        [ backgroundImage <| url (iconSelector iconSource)
        , backgroundRepeat noRepeat
        , backgroundPosition center
        , backgroundSize contain
        , backgroundOrigin contentBox
        ]


boxBackground : IconBackground
boxBackground =
    iconBackground .box


calendarBackground : IconBackground
calendarBackground =
    iconBackground .calendar


eyeBackground : IconBackground
eyeBackground =
    iconBackground .eye


fiveHundredPxBackground : IconBackground
fiveHundredPxBackground =
    iconBackground .fiveHundredPx


githubBackground : IconBackground
githubBackground =
    iconBackground .github


heartBackground : IconBackground
heartBackground =
    iconBackground .heart


linkedinBackground : IconBackground
linkedinBackground =
    iconBackground .linkedin


mailBackground : IconBackground
mailBackground =
    iconBackground .mail


printerBackground : IconBackground
printerBackground =
    iconBackground .printer


stackOverflowBackground : IconBackground
stackOverflowBackground =
    iconBackground .stackOverflow


twitterBackground : IconBackground
twitterBackground =
    iconBackground .twitter
