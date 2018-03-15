module View.Details
    exposing
        ( maybeViewDetails
        )

import Css exposing (alignItems, backgroundColor, borderRadius, borderWidth, bottom, center, color, display, em, fixed, fontSize, height, justifyContent, lastChild, left, lineHeight, marginBottom, marginRight, marginTop, maxWidth, none, num, opacity, position, px, right, spaceBetween, textDecoration, top, underline, width, zero)
import CssShorthand exposing (batchMap, borderSolidColor, displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom, paddingRightLeft, paddingTopBottom, willChangeTransform)
import Html.Styled exposing (Html, a, div, h1, li, p, span, styled, text, ul)
import Html.Styled.Attributes exposing (href, title)
import HtmlShorthand exposing (ariaLabel, onClickPreventDefault, styledSpanText, targetBlank)
import Icon exposing (IconBackground, IconSource, iconStyle)
import MarkedString exposing (MarkedString, markedString)
import Model exposing (Details, Model)
import Msg exposing (Msg(DetailsClose))
import View.Button as Button
import View.Colors exposing (black, blackLevel, extraPaleGreen, paleGreen, white)
import View.DetailsAnimation exposing (animateDetails)
import View.Metrics exposing (standardBorderRadius, standardLineHeight, standardScreenFontSize)


maybeViewDetails : Model -> Maybe (Html Msg)
maybeViewDetails model =
    model.details
        |> Maybe.map (viewDetails model)


viewDetails : Model -> Details -> Html Msg
viewDetails model details =
    let
        style =
            [ display none
            , displayFlexColumn
            , justifyContent center
            , alignItems center
            , position fixed
            , batchMap [ top, right, bottom, left ] zero
            , backgroundColor extraPaleGreen
            , fontSize standardScreenFontSize
            , lineHeight <| num standardLineHeight
            , color black
            , willChangeTransform
            , animateDetails model
            ]
    in
    styled div
        style
        []
        [ viewContent model details ]


viewContent : Model -> Details -> Html Msg
viewContent model details =
    let
        style =
            [ Button.border
            , displayFlexColumn
            , marginTopBottom <| em 1
            , marginRightLeft <| em 3
            , backgroundColor white
            , paddingTopBottom <| em 0.9
            , paddingRightLeft <| em 1.5
            , maxWidth <| em 30
            , fontSize <| em 0.8
            ]
    in
    styled div
        style
        []
        [ viewHeader model.iconSource details.name
        , viewLinks model.iconSource
        , viewIntro
            "There’s always something new to learn, some deeper understanding to be gained, some path to grow my skills."
        , viewPoints
            [ markedString "At `Unitron`, I learned the ins and outs of numerous internal business and software systems, helping me make my team’s solutions more robust"
            , markedString "In `Forks in the Road`, I learned how to use JWT authentication for a API-only `Rails` app"
            , markedString "In `Off-Grid Orcs`, I learned how to apply a `functional programming` architecture to a highly-interactive application"
            ]
        ]


viewHeader : IconSource -> String -> Html Msg
viewHeader iconSource headerText =
    let
        style =
            [ displayFlexRow
            , justifyContent spaceBetween
            , alignItems top
            , fontSize <| em 1.6
            , marginTop zero
            , marginBottom <| em 0.2
            ]
    in
    styled h1
        style
        []
        [ text headerText
        , viewCloseButton iconSource
        ]


viewCloseButton : IconSource -> Html Msg
viewCloseButton iconSource =
    let
        style =
            [ iconStyle iconSource .xSquare
            , marginTop <| em 0.3
            , batchMap [ width, height ] <| px 24
            , opacity <| num (1 - toFloat blackLevel / 255)
            ]
    in
    styled a
        style
        [ title "Close"
        , ariaLabel "Close"
        , href "#"
        , onClickPreventDefault (always <| DetailsClose)
        ]
        []


viewLinks : IconSource -> Html Msg
viewLinks iconSource =
    let
        style =
            [ displayFlexRow
            , marginTop zero
            , marginBottom <| em 0.6
            , marginRightLeft <| em 0.2
            ]
    in
    styled p
        style
        []
        [ viewLink iconSource "Homepage" .home
        , viewLink iconSource "Source code" .github
        ]


viewLink : IconSource -> String -> IconBackground -> Html Msg
viewLink iconSource linkText iconBackground =
    let
        style =
            [ displayFlexRow
            , alignItems center
            , marginRight <| em 1.0
            , lastChild [ marginRight zero ]
            , paddingTopBottom <| em 0.3
            , paddingRightLeft <| em 0.7
            , borderSolidColor paleGreen
            , borderWidth <| px 1
            , borderRadius standardBorderRadius
            , color black
            , textDecoration none
            ]
    in
    styled a
        style
        [ href "about:blank"
        , targetBlank
        ]
        [ viewLinkIcon iconSource iconBackground
        , text linkText
        ]


viewLinkIcon : IconSource -> IconBackground -> Html Msg
viewLinkIcon iconSource iconBackground =
    let
        style =
            [ iconStyle iconSource iconBackground
            , marginRight <| em 0.3
            , batchMap [ width, height ] <| px 24
            , opacity <| num (1 - toFloat blackLevel / 255)
            ]
    in
    styled span style [] []


viewIntro : String -> Html Msg
viewIntro introText =
    let
        style =
            [ marginTopBottom zero
            ]
    in
    styled p
        style
        []
        [ text introText ]


viewPoints : List MarkedString -> Html Msg
viewPoints points =
    let
        style =
            [ marginTop zero
            , marginBottom <| em 1.0
            ]
    in
    styled ul
        style
        []
        (List.map viewPoint points)


viewPoint : MarkedString -> Html Msg
viewPoint =
    let
        style =
            [ marginTopBottom <| em 1.0
            , lastChild [ marginBottom zero ]
            ]
    in
    MarkedString.transform text (styledSpanText [ textDecoration underline ])
        >> styled li style []
