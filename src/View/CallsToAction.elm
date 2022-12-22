module View.CallsToAction exposing (viewCallsToAction)

import Assets exposing (Assets)
import Css exposing (Style, alignItems, center, em, firstOfType, flexEnd, flexGrow, justifyContent, marginLeft, marginRight, marginTop, num, px, stretch, zero)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, displayFlexRowReverse, marginRightLeft)
import Data exposing (Data)
import Html.Styled exposing (Html, a, div, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (HtmlTag, targetBlank)
import Icon exposing (IconBackground, IconSource, iconSpan)
import Msg exposing (Msg)
import View.Breakpoints exposing (breakpointPortfolioMedium)
import View.Button as Button
import View.Links exposing (viewLinks)


viewCallsToAction : Assets -> Data -> Html Msg
viewCallsToAction assets data =
    let
        style =
            [ displayFlexColumn
            ]
    in
    styled div
        style
        []
        [ viewCallToActionExtra assets data
        , viewLinks assets data
        ]


viewCallToActionExtra : Assets -> Data -> Html Msg
viewCallToActionExtra assets data =
    let
        iconSource =
            assets.iconSource

        emailAddress =
            data.basic.emailAddress

        style =
            [ displayFlexColumn
            , breakpointPortfolioMedium
                [ displayFlexRow
                ]
            , justifyContent stretch
            , alignItems center
            , marginTop <| em 1.2
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
            .user
            [ href "#resume" ]
            [ text "View my resume" ]
        ]


viewCallToAction : IconSource -> Style -> IconBackground -> HtmlTag Msg
viewCallToAction iconSource displayStyle iconBackground attributes elements =
    let
        style =
            [ displayFlexRowReverse
            , breakpointPortfolioMedium
                [ displayStyle
                ]
            , justifyContent flexEnd
            , alignItems center
            , marginTop <| em 1.1
            , firstOfType
                [ marginTop zero
                ]
            , breakpointPortfolioMedium
                [ marginTop zero
                , flexGrow <| num 1
                ]
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
    iconSpan
        [ marginLeft <| px 8
        , marginRight <| px -32
        , breakpointPortfolioMedium
            [ marginRight <| px 8
            ]
        ]


viewCallToActionButton : HtmlTag Msg
viewCallToActionButton =
    styled a
        [ Button.border
        , Button.sizeLarge
        , Button.text
        , marginRightLeft <| px 18
        ]
