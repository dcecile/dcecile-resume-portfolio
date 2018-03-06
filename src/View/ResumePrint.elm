module View.ResumePrint
    exposing
        ( viewResumePrint
        )

import Css exposing (display, fontSize, minHeight, none, vh)
import CssShorthand exposing (displayFlexColumn, mediaPrint)
import Html.Styled exposing (Html, div, styled)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Metrics exposing (standardPrintFontSize)
import View.Resume exposing (viewResume)


viewResumePrint : Model -> Html Msg
viewResumePrint model =
    let
        style =
            [ display none
            , minHeight (vh 100)
            , fontSize standardPrintFontSize
            , mediaPrint [ displayFlexColumn ]
            ]
    in
    styled div
        style
        []
        [ viewResume model ]
