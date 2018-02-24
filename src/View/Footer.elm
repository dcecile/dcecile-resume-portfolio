module View.Footer
    exposing
        ( viewFooter
        )

import Css exposing (alignSelf, bold, borderWidth, center, color, em, fontSize, fontStyle, fontWeight, italic, lineHeight, marginBottom, marginTop, num, px)
import CssShorthand exposing (borderBottomSolidColor, displayFlexColumn, marginTopBottom, paddingRightLeft)
import Html.Styled exposing (Html, a, br, footer, h2, p, styled, text)
import Html.Styled.Attributes exposing (href, id)
import HtmlShorthand exposing (targetBlank)
import Msg exposing (Msg)
import View.Button as Button
import View.Colors exposing (black, green, paleGreen)
import View.ElmLogo exposing (viewElmLogo)


viewFooter : Html Msg
viewFooter =
    let
        style =
            [ displayFlexColumn
            , borderBottomSolidColor paleGreen
            , borderWidth <| px 6
            ]
    in
    styled footer
        style
        [ id "fin" ]
        [ viewHeader
        , viewButton
        , viewInfo
        ]


viewHeader : Html Msg
viewHeader =
    let
        style =
            [ marginTop <| em 3.0
            , marginBottom <| em 1.0
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
            , Button.sizeMedium
            , Button.text
            , alignSelf center
            , marginTopBottom <| px 10
            ]
    in
    styled a
        style
        [ href <| "#top" ]
        [ text "Go back to the top" ]


viewInfo : Html Msg
viewInfo =
    let
        style =
            [ marginTop <| em 2.5
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
            [ href "https://github.com/dcecile/dcecile-resume-portfolio"
            , targetBlank
            ]
            [ text "(view source)" ]
        ]
