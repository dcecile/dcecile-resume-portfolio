module View.ResumePrint exposing (viewResumePrint)

import Assets exposing (Assets)
import Css exposing (fontSize, minHeight, vh)
import CssShorthand exposing (displayFlexColumn, displayNone, mediaPrint)
import Data exposing (Data)
import Html.Styled exposing (Html, div, styled)
import LazyHtml exposing (LazyHtml, toLazyHtml)
import Msg exposing (Msg)
import View.Metrics exposing (standardPrintFontSize)
import View.Resume exposing (viewResume)


viewResumePrint : Assets -> Data -> LazyHtml Msg
viewResumePrint assets data =
    let
        style =
            [ displayNone
            , minHeight (vh 100)
            , fontSize standardPrintFontSize
            , mediaPrint [ displayFlexColumn ]
            ]
    in
    styled div
        style
        []
        [ viewResume assets data ]
        |> toLazyHtml
