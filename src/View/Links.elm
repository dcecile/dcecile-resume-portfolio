module View.Links
    exposing
        ( linksCutoff
        , viewLinks
        )

import Css exposing (Compatible, Em, auto, calc, center, em, fontSize, fontWeight, height, justifyContent, marginBottom, marginTop, normal, padding, plus, px, width, zero)
import CssShorthand exposing (displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom, paddingRightLeft, paddingTopBottom)
import Html.Styled exposing (Html, a, div, h2, nav, styled, text)
import Html.Styled.Attributes exposing (href, title)
import HtmlShorthand exposing (ariaLabel, targetBlank)
import Icon exposing (IconBackground, fiveHundredPxBackground, githubBackground, linkedinBackground, stackOverflowBackground, twitterBackground)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Button as Button
import View.GroupBox as GroupBox
import View.Metrics exposing (standardBorderWidth, standardLineHeight)


type alias CalculatedLength =
    { value : String
    , length : Compatible
    , lengthOrAuto : Compatible
    , lengthOrNumber : Compatible
    , lengthOrNone : Compatible
    , lengthOrMinMaxDimension : Compatible
    , lengthOrNoneOrMinMaxDimension : Compatible
    , textIndent : Compatible
    , flexBasis : Compatible
    , lengthOrNumberOrAutoOrNoneOrContent : Compatible
    , fontSize : Compatible
    , lengthOrAutoOrCoverOrContain : Compatible
    , calc : Compatible
    }


linksCutoff : CalculatedLength
linksCutoff =
    let
        add =
            flip calc plus

        cutoffFactor =
            0.5
    in
    standardBorderWidth
        |> add linksTopBottomPadding
        |> add (em standardLineHeight)
        |> add linksListTopPadding
        |> add standardBorderWidth
        |> add linkIconPadding
        |> add (em (cutoffFactor * linkIconSize.numericValue))


linksTopBottomPadding : Em
linksTopBottomPadding =
    em 0.7


linksListTopPadding : Em
linksListTopPadding =
    em 0.8


linkIconPadding : Em
linkIconPadding =
    em 0.4


linkIconSize : Em
linkIconSize =
    em 1.5


viewLinks : Model -> Html Msg
viewLinks model =
    let
        style =
            [ displayFlexColumn
            , GroupBox.border
            , paddingTopBottom <| linksTopBottomPadding
            , paddingRightLeft <| em 1.0
            , marginRightLeft auto
            , marginBottom <| em 2.0
            ]
    in
    styled nav
        style
        []
        [ viewLinksDescription
        , viewLinkList model
        ]


viewLinksDescription : Html Msg
viewLinksDescription =
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
        [ text "Find me online:" ]


viewLinkList : Model -> Html Msg
viewLinkList model =
    let
        style =
            [ displayFlexRow
            , justifyContent center
            , marginTop linksListTopPadding
            , marginBottom <| em 0.5
            ]
    in
    styled div
        style
        []
        [ viewLink model "GitHub" githubBackground "https://github.com/dcecile"
        , viewLink model "LinkedIn" linkedinBackground "https://www.linkedin.com/in/dancecile"
        , viewLink model "Stack Overflow" stackOverflowBackground "https://stackoverflow.com/users/207321/dan-cecile?tab=profile"
        , viewLink model "Twitter" twitterBackground "https://twitter.com/dancecile"
        , viewLink model "500px" fiveHundredPxBackground "https://500px.com/dancecile"
        ]


viewLink : Model -> String -> IconBackground -> String -> Html Msg
viewLink model name iconBackground url =
    let
        style =
            [ iconBackground model.iconSource
            , padding linkIconPadding
            , width linkIconSize
            , height linkIconSize
            , marginRightLeft <| px 11
            , Button.border
            ]
    in
    styled a
        style
        [ title name
        , ariaLabel name
        , href url
        , targetBlank
        ]
        []
