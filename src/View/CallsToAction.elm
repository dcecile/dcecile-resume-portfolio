module View.CallsToAction exposing (viewCallsToAction)

import Assets exposing (Assets)
import Css exposing (Style, alignItems, alignSelf, backgroundColor, center, em, firstOfType, flexEnd, flexGrow, fontSize, fontWeight, justifyContent, marginLeft, marginRight, marginTop, normal, num, px, stretch, zero)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, displayFlexRowReverse, marginRightLeft, marginTopBottom, paddingRightLeft, paddingTopBottom)
import Data exposing (Data)
import Html.Styled exposing (Html, a, div, h2, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (HtmlTag, targetBlank)
import Icon exposing (IconBackground, IconSource, iconSpan)
import Msg exposing (Msg)
import View.Breakpoints exposing (breakpointPortfolioMedium)
import View.Button as Button
import View.Colors exposing (extraPaleGreen, white)
import View.GroupBox as GroupBox
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
        [ viewMeeting data
        , viewCallToActionExtra assets data
        , viewLinks assets data
        ]


viewMeeting : Data -> Html Msg
viewMeeting data =
    let
        style =
            [ GroupBox.border
            , displayFlexColumn
            , alignSelf center
            , marginTop <| em 1.2
            , paddingTopBottom <| em 1.2
            , paddingRightLeft <| em 1.4
            , backgroundColor extraPaleGreen
            ]
    in
    styled div
        style
        []
        [ viewMeetingDescription
        , viewMeetingButton data
        ]


viewMeetingDescription : Html Msg
viewMeetingDescription =
    let
        style =
            [ marginTopBottom zero
            , fontSize <| em 1
            , fontWeight normal
            ]
    in
    styled h2
        style
        []
        [ text "Let’s chat." ]


viewMeetingButton : Data -> Html Msg
viewMeetingButton data =
    let
        meetingURL =
            data.basic.meetingURL
    in
    styled a
        [ Button.border
        , Button.sizeLarge
        , Button.text
        , marginTop <| em 0.8
        , backgroundColor white
        ]
        [ href meetingURL
        , targetBlank
        ]
        [ text "Book a virtual meeting"
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
            , marginTop <| em 1.4
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
