module View.Footer exposing (viewFooter)

import Assets exposing (Assets)
import Css exposing (alignSelf, borderWidth, center, color, em, fontSize, fontStyle, italic, marginBottom, marginTop, px, zero)
import CssShorthand exposing (borderBottomSolidColor, displayFlexColumn, displayInitial, displayNone, marginRightLeft)
import Data exposing (Data)
import Html.Styled exposing (Html, a, br, footer, p, styled, text)
import Html.Styled.Attributes exposing (href, id)
import HtmlShorthand exposing (targetBlank)
import Msg exposing (Msg)
import View.Breakpoints exposing (breakpointPortfolioMedium)
import View.Button as Button
import View.CallsToAction exposing (viewCallsToAction)
import View.Colors exposing (black, paleGreen)
import View.ElmLogo exposing (viewElmLogo)


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
    in
    styled footer
        style
        [ id "fin" ]
        [ viewDescription
        , viewCallsToAction assets data
        , viewButton
        , viewInfo basicData.sourceURL
        ]


viewDescription : Html Msg
viewDescription =
    let
        style =
            [ marginTop <| em 3.0
            , marginBottom <| zero
            , marginRightLeft <| em 1.0
            ]
    in
    styled p
        style
        []
        [ text "Thanks so much for taking the time to view my portfolio. Want to learn more?" ]


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
