module View.Links
    exposing
        ( viewLinks
        )

import Css exposing (auto, center, em, height, justifyContent, margin, marginBottom, marginTop, padding, px, width, zero)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, marginRightLeft, paddingRightLeft, paddingTopBottom)
import Html.Styled exposing (Html, a, div, p, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (targetBlank)
import Icon exposing (IconBackground, fiveHundredPxBackground, githubBackground, linkedinBackground, stackOverflowBackground, twitterBackground)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Button as Button
import View.GroupBox as GroupBox


viewLinks : Model -> Html Msg
viewLinks model =
    let
        style =
            [ displayFlexColumn
            , GroupBox.border
            , paddingTopBottom <| em 0.7
            , paddingRightLeft <| em 1.0
            , marginRightLeft <| auto
            , marginBottom <| em 4
            ]
    in
    styled div
        style
        []
        [ viewLinksDescription
        , viewLinkList model
        ]


viewLinksDescription : Html Msg
viewLinksDescription =
    let
        style =
            [ margin <| zero
            ]
    in
    styled p
        style
        []
        [ text "Find me online:" ]


viewLinkList : Model -> Html Msg
viewLinkList model =
    let
        style =
            [ displayFlexRow
            , justifyContent center
            , marginTop <| em 0.8
            , marginBottom <| em 0.5
            ]

        icons =
            [ ( githubBackground, "https://github.com/dcecile" )
            , ( linkedinBackground, "https://www.linkedin.com/in/dancecile" )
            , ( stackOverflowBackground, "https://stackoverflow.com/users/207321/dan-cecile?tab=profile" )
            , ( twitterBackground, "https://twitter.com/dancecile" )
            , ( fiveHundredPxBackground, "https://500px.com/dancecile" )
            ]
    in
    styled div
        style
        []
        (List.map (uncurry <| viewLink model) icons)


viewLink : Model -> IconBackground -> String -> Html Msg
viewLink model iconBackground url =
    let
        ( iconSize, paddingSize ) =
            ( em 1.5, em 0.4 )

        style =
            [ iconBackground model.iconSource
            , padding paddingSize
            , width iconSize
            , height iconSize
            , marginRightLeft <| px 11
            , Button.border
            ]
    in
    styled a
        style
        [ href url
        , targetBlank
        ]
        []
