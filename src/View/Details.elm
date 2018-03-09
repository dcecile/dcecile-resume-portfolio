module View.Details
    exposing
        ( maybeViewDetails
        )

import Css exposing (alignItems, auto, backgroundColor, bottom, center, color, cursor, display, em, fixed, flexGrow, fontSize, justifyContent, left, lineHeight, marginBottom, marginTop, maxWidth, none, num, overflowY, pointer, position, right, spaceBetween, textDecoration, top, underline, zero)
import CssShorthand exposing (batchMap, displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom, paddingRightLeft, paddingTopBottom, willChangeTransform)
import Html.Styled exposing (Html, div, h1, li, p, styled, text, ul)
import HtmlShorthand exposing (onClickPreventDefault, styledSpanText)
import Icon exposing (IconSource, iconSpan)
import MarkedString exposing (MarkedString, markedString)
import Model exposing (Model)
import Msg exposing (Msg(DetailsClose))
import View.Button as Button
import View.Colors exposing (black, extraPaleGreen, white)
import View.DetailsAnimation exposing (animateDetails)
import View.Metrics exposing (standardLineHeight, standardScreenFontSize)


maybeViewDetails : Model -> Maybe (Html Msg)
maybeViewDetails model =
    model.details
        |> Maybe.map (always (viewDetails model))


viewDetails : Model -> Html Msg
viewDetails model =
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
            , cursor pointer
            , willChangeTransform
            , animateDetails model
            ]
    in
    styled div
        style
        [ onClickPreventDefault (always <| DetailsClose) ]
        [ viewContent model ]


viewContent : Model -> Html Msg
viewContent model =
    let
        style =
            [ Button.border
            , marginTopBottom <| em 3
            , marginRightLeft <| em 3
            , overflowY auto
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
        [ viewHeader model.iconSource "Learning"
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
            , alignItems center
            , fontSize <| em 1.4
            , marginTop zero
            , marginBottom <| em 0.5
            ]
    in
    styled h1
        style
        []
        [ text headerText
        , iconSpan (em 0.1) iconSource .xSquare
        ]


viewIntro : String -> Html Msg
viewIntro introText =
    let
        style =
            [ marginTop zero
            , marginBottom <| em 1.0
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
            ]
    in
    MarkedString.transform text (styledSpanText [ textDecoration underline ])
        >> styled li style []
