module View.Links exposing (viewLinks)

import Assets exposing (Assets)
import Css exposing (alignItems, center, color, em, flexWrap, fontSize, height, justifyContent, lineHeight, marginBottom, marginRight, marginTop, none, num, textDecoration, width, wrap)
import CssShorthand exposing (batchMap, displayFlexRow, marginRightLeft, marginTopBottom, paddingRightLeft)
import Data exposing (Data)
import Data.Links exposing (LinksItemData)
import Html.Styled exposing (Html, a, div, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (ariaLabel, targetBlank)
import Icon exposing (IconSource, iconSpan)
import Msg exposing (Msg)
import View.Button as Button
import View.Colors exposing (black)


viewLinks : Assets -> Data -> Html Msg
viewLinks assets data =
    let
        style =
            [ displayFlexRow
            , justifyContent center
            , flexWrap wrap
            , marginTop <| em 1.2
            , marginRightLeft <| em 2.0
            , marginBottom <| em 2.0
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
            , paddingRightLeft <| em 0.8
            , lineHeight <| num 2.4
            , displayFlexRow
            , alignItems center
            , marginTopBottom <| em 0.5
            , marginRightLeft <| em 0.7
            , fontSize <| em 0.85
            , color black
            , textDecoration none
            ]

        iconStyle =
            [ batchMap [ width, height ] <| em 1.5
            , marginRight <| em 0.5
            ]
    in
    styled a
        style
        [ ariaLabel linksItem.name
        , href linksItem.url
        , targetBlank
        ]
        [ iconSpan iconStyle iconSource linksItem.iconBackground, text linksItem.name ]
