module View.CallsToAction
    exposing
        ( viewCallsToAction
        )

import Css exposing (Style, alignItems, batch, center, em, flexBasis, flexEnd, flexGrow, justifyContent, marginTop, num, px, stretch)
import CssShorthand exposing (displayFlexRow, displayFlexRowReverse, marginRightLeft)
import Html.Styled exposing (Html, a, div, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (HtmlTag, hrefHash, onClickPreventDefault, targetBlank)
import Icon exposing (IconBackground, IconSource, iconSpan)
import Model exposing (Model)
import Msg exposing (Msg(Print))
import View.Button as Button


viewCallsToAction : List Style -> Model -> Html Msg
viewCallsToAction customStyle model =
    let
        iconSource =
            model.iconSource

        emailAddress =
            model.data.basic.emailAddress

        style =
            [ displayFlexRow
            , justifyContent stretch
            , marginTop <| em 1.2
            , batch customStyle
            ]
    in
    styled div
        style
        []
        [ viewCallToAction iconSource
            displayFlexRow
            .mail
            [ href <| "mailto:" ++ emailAddress ++ "?subject=Hi"
            , targetBlank
            ]
            [ text "Send me an email" ]
        , viewCallToAction iconSource
            displayFlexRowReverse
            .printer
            [ hrefHash
            , onClickPreventDefault (always Print)
            ]
            [ text "Print my resume" ]
        ]


viewCallToAction : IconSource -> Style -> IconBackground -> HtmlTag Msg
viewCallToAction iconSource displayStyle iconBackground attributes elements =
    let
        style =
            [ displayStyle
            , justifyContent flexEnd
            , alignItems center
            , flexBasis <| em 0
            , flexGrow <| num 1
            ]
    in
    styled div
        style
        []
        [ viewCallToActionIcon iconSource iconBackground
        , viewCallToActionButton attributes elements
        ]


viewCallToActionIcon : IconSource -> IconBackground -> Html Msg
viewCallToActionIcon =
    iconSpan [ marginRightLeft <| px 8 ]


viewCallToActionButton : HtmlTag Msg
viewCallToActionButton =
    let
        style =
            [ Button.border
            , Button.sizeLarge
            , Button.text
            , marginRightLeft <| px 18
            ]
    in
    styled a style
