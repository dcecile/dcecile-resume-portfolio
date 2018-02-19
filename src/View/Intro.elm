module View.Intro
    exposing
        ( viewIntro
        )

import Css exposing (bold, center, em, flexBasis, fontSize, fontStyle, fontWeight, height, italic, justifyContent, normal, px, vh, zero)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom)
import Html.Styled exposing (Html, a, div, h1, h2, p, span, styled, text)
import Html.Styled.Attributes exposing (href, target)
import HtmlShorthand exposing (HtmlTag, hrefHash, onClickPreventDefault, targetBlank)
import Icon exposing (IconBackground, fiveHundredPxBackground, githubBackground, linkedinBackground, mailBackground, printerBackground, stackOverflowBackground, twitterBackground)
import Model exposing (Model)
import Msg exposing (Msg(Print))


viewIntro : Model -> Html Msg
viewIntro model =
    let
        style =
            [ displayFlexColumn
            , height (vh 100)
            ]
    in
    styled div
        style
        []
        [ viewName
        , viewTitle
        , viewSellingPoint
        , viewPitch
        , viewCallsToAction model
        , viewExternalLinks model
        ]


viewName : Html Msg
viewName =
    let
        style =
            [ fontWeight normal
            , fontSize <| em 2.2
            ]
    in
    styled h1
        style
        []
        [ text "Dan Cecile" ]


viewTitle : Html Msg
viewTitle =
    let
        style =
            [ fontWeight normal
            , fontSize <| em 1
            , fontStyle italic
            ]
    in
    styled h2
        style
        []
        [ text "Software developer generalist" ]


viewSellingPoint : Html Msg
viewSellingPoint =
    p
        []
        [ text "10 years of experience learning new tech, writing code, and improving systems." ]


viewPitch : Html Msg
viewPitch =
    let
        style =
            [ fontWeight bold ]
    in
    styled p
        style
        []
        [ text "How can I help your team grow?" ]


viewCallsToAction : Model -> Html Msg
viewCallsToAction model =
    let
        style =
            [ displayFlexRow
            , justifyContent center
            ]
    in
    styled div
        style
        []
        [ viewCallToActionIcon model mailBackground
        , viewCallToActionButton
            [ href "mailto:dancecile@gmail.com?subject=Hi"
            , targetBlank
            ]
            [ text "Send me an email" ]
        , viewCallToActionButton
            [ hrefHash
            , onClickPreventDefault Print
            ]
            [ text "Print my resume" ]
        , viewCallToActionIcon model printerBackground
        ]


viewCallToActionIcon : Model -> IconBackground -> Html Msg
viewCallToActionIcon model iconBackground =
    let
        style =
            [ iconBackground model.iconSource
            , flexBasis <| px 24
            ]
    in
    styled span
        style
        []
        []


viewCallToActionButton : HtmlTag Msg
viewCallToActionButton =
    let
        style =
            [ marginRightLeft <| em 0.5
            ]
    in
    styled a style


viewExternalLinks : Model -> Html Msg
viewExternalLinks model =
    let
        style =
            [ displayFlexRow
            , justifyContent center
            , marginTopBottom <| em 1.0
            ]

        icons =
            [ githubBackground
            , linkedinBackground
            , stackOverflowBackground
            , twitterBackground
            , fiveHundredPxBackground
            ]
    in
    styled div
        style
        []
        (List.map (viewExternalLink model) icons)


viewExternalLink : Model -> IconBackground -> Html Msg
viewExternalLink model iconBackground =
    let
        style =
            [ iconBackground model.iconSource
            , flexBasis <| em 2
            , height <| em 2
            , marginRightLeft <| em 0.2
            ]
    in
    styled a
        style
        [ href "about:blank"
        , targetBlank
        ]
        []
