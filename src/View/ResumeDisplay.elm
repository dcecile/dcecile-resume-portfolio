module View.ResumeDisplay
    exposing
        ( viewResumeDisplay
        )

import Css exposing (Vw, backgroundColor, boxShadow5, display, flexGrow, fontSize, height, hex, none, num, px, vw, zero)
import CssShorthand exposing (displayFlexColumn, marginRightLeft, marginTopBottom, mediaNotPrint, willChangeTransform)
import Html.Styled exposing (Html, div, styled)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Metrics exposing (standardPrintFontSize)
import View.Resume exposing (viewResume)


pageWidthPt : Float
pageWidthPt =
    8.5 * 72


pageHeightPt : Float
pageHeightPt =
    11 * 72


marginWidthPt : Float
marginWidthPt =
    2.5 * 72


marginHeightPt : Float
marginHeightPt =
    0.7 * 72


fullWidthPt : Float
fullWidthPt =
    pageWidthPt + marginWidthPt * 2


fullHeightPt : Float
fullHeightPt =
    pageHeightPt + marginHeightPt * 2


ptToVw : Float -> Vw
ptToVw length =
    vw <| length / fullWidthPt * 100


viewResumeDisplay : Model -> Html Msg
viewResumeDisplay model =
    let
        style =
            [ willChangeTransform
            , display none
            , height <| ptToVw fullHeightPt
            , backgroundColor <| hex "#dadada"
            , fontSize <| ptToVw standardPrintFontSize.numericValue
            , mediaNotPrint [ displayFlexColumn ]
            ]
    in
    styled div
        style
        []
        [ viewPage model ]


viewPage : Model -> Html Msg
viewPage model =
    let
        style =
            [ displayFlexColumn
            , marginTopBottom <| ptToVw marginHeightPt
            , marginRightLeft <| ptToVw marginWidthPt
            , boxShadow5
                (px 2)
                (px 2)
                (px 14)
                zero
                (hex "#313131")
            , flexGrow <| num 1
            , backgroundColor <| hex "#ffffff"
            ]
    in
    styled div
        style
        []
        [ viewResume model ]
