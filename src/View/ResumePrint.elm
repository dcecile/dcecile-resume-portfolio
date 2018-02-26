module View.ResumePrint
    exposing
        ( viewResumePrint
        )

import Css exposing (display, fontSize, minHeight, none, vh)
import Css.Media exposing (only, print, withMedia)
import CssShorthand exposing (displayFlexColumn)
import Html.Styled exposing (Html, div, styled)
import Msg exposing (Msg)
import View.Metrics exposing (standardPrintFontSize)
import View.Resume exposing (viewResume)


viewResumePrint : Html Msg
viewResumePrint =
    let
        style =
            [ display none
            , minHeight (vh 100)
            , fontSize standardPrintFontSize
            , withMedia
                [ only print [] ]
                [ displayFlexColumn ]
            ]
    in
    styled div
        style
        []
        [ viewResume ]
