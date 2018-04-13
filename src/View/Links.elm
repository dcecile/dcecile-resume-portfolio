module View.Links
    exposing
        ( linksCutoff
        , viewLinks
        )

import Assets exposing (Assets)
import Css exposing (Compatible, Em, Px, alignSelf, calc, center, em, flexWrap, fontSize, fontWeight, height, initial, justifyContent, marginBottom, marginTop, maxWidth, normal, padding, plus, px, width, wrap, zero)
import CssShorthand exposing (batchMap, displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom, paddingRightLeft, paddingTopBottom)
import Data exposing (Data)
import Data.Links exposing (LinksItemData)
import Html.Styled exposing (Html, a, div, h2, nav, styled, text)
import Html.Styled.Attributes exposing (href, title)
import HtmlShorthand exposing (ariaLabel, targetBlank)
import Icon exposing (IconBackground, IconSource, iconSpan)
import Msg exposing (Msg)
import View.Breakpoints exposing (breakpointPortfolioMedium)
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
        |> add linksListTopMargin
        |> add linkIconMargin
        |> add standardBorderWidth
        |> add linkIconPadding
        |> add (em (cutoffFactor * linkIconSize.numericValue))


linksTopBottomPadding : Em
linksTopBottomPadding =
    em 0.7


linksListTopMargin : Em
linksListTopMargin =
    em 0.5


linkIconMargin : Px
linkIconMargin =
    px 8


linkIconPadding : Em
linkIconPadding =
    em 0.4


linkIconSize : Em
linkIconSize =
    em 1.5


viewLinks : Assets -> Data -> Html Msg
viewLinks assets data =
    let
        style =
            [ GroupBox.border
            , displayFlexColumn
            , alignSelf center
            , marginRightLeft <| em 2.0
            , marginBottom <| em 2.0
            , paddingTopBottom <| linksTopBottomPadding
            , paddingRightLeft <| em 1.0
            , maxWidth <| em 11
            , breakpointPortfolioMedium
                [ maxWidth initial
                ]
            ]
    in
    styled nav
        style
        []
        [ viewLinksDescription
        , viewLinkList assets data
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


viewLinkList : Assets -> Data -> Html Msg
viewLinkList assets data =
    let
        style =
            [ displayFlexRow
            , justifyContent center
            , flexWrap wrap
            , marginTop linksListTopMargin
            , marginBottom <| em 0.2
            ]
    in
    data.links.portfolioItems
        |> List.map (viewLink assets.iconSource)
        |> styled div style []


viewLink : IconSource -> LinksItemData -> Html Msg
viewLink iconSource linksItem =
    let
        style =
            [ Button.border
            , displayFlexRow
            , marginTopBottom linkIconMargin
            , marginRightLeft <| px 11
            , padding linkIconPadding
            ]

        iconStyle =
            [ batchMap [ width, height ] linkIconSize
            ]
    in
    styled a
        style
        [ title linksItem.name
        , ariaLabel linksItem.name
        , href linksItem.url
        , targetBlank
        ]
        [ iconSpan iconStyle iconSource linksItem.iconBackground ]
