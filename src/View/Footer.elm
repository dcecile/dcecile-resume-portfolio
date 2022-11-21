module View.Footer exposing (viewFooter)

import Assets exposing (Assets)
import Css exposing (alignSelf, bold, borderWidth, center, color, em, fontSize, fontStyle, fontWeight, italic, lineHeight, marginBottom, marginTop, num, px, zero)
import CssShorthand exposing (borderBottomSolidColor, displayFlexColumn, displayInitial, displayNone, paddingRightLeft)
import Data exposing (Data)
import Html.Styled exposing (Html, a, br, footer, h2, p, styled, text)
import Html.Styled.Attributes exposing (href, id)
import HtmlShorthand exposing (targetBlank)
import Msg exposing (Msg)
import View.Breakpoints exposing (breakpointPortfolioMedium)
import View.Button as Button
import View.CallsToAction exposing (viewCallsToAction)
import View.Colors exposing (black, green, paleGreen)
import View.ElmLogo exposing (viewElmLogo)
import View.Links exposing (viewLinks)


viewFooter : Assets -> Data -> Html Msg
viewFooter assets data =
    let
        basicData =
            data.basic

        style =
            [ displayFlexColumn
            , borderBottomSolidColor paleGreen
            , borderWidth <| px 6
            ]

        callsToActionStyle =
            [ marginBottom <| em 2.5
            ]
    in
    styled footer
        style
        [ id "fin" ]
        [ viewHeader
        , viewButton
        , viewCallsToAction callsToActionStyle assets data
        , viewLinks assets data
        , viewInfo basicData.sourceURL
        ]


viewHeader : Html Msg
viewHeader =
    let
        style =
            [ marginTop <| em 3.0
            , marginBottom <| em 0.8
            , breakpointPortfolioMedium
                [ marginBottom <| em 2.3
                ]
            , fontWeight bold
            , fontSize <| em 1.0
            ]
    in
    styled h2
        style
        []
        [ text "fin." ]


viewButton : Html Msg
viewButton =
    let
        style =
            [ Button.border
            , Button.sizeLarge
            , Button.text
            , displayNone
            , breakpointPortfolioMedium
                [ displayInitial
                ]
            , alignSelf center
            , marginTop zero
            , marginBottom <| em 0.5
            ]
    in
    styled a
        style
        [ href <| "#top" ]
        [ text "Go back to the top" ]


viewInfo : String -> Html Msg
viewInfo sourceURL =
    let
        style =
            [ marginTop <| em 0.5
            , marginBottom <| em 1.5
            , fontSize <| em 0.85
            , fontStyle italic
            ]

        linkStyle =
            [ color black
            ]
    in
    styled p
        style
        []
        [ text "I made this website with "
        , styled a
            linkStyle
            [ href "http://elm-lang.org/"
            , targetBlank
            ]
            [ text "Elm" ]
        , text " "
        , viewElmLogo
        , br [] []
        , styled a
            linkStyle
            [ href sourceURL
            , targetBlank
            ]
            [ text "(view source)" ]
        ]
