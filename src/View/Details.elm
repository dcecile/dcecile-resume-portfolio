module View.Details
    exposing
        ( maybeViewDetails
        )

import Css exposing (bottom, display, em, fixed, flexGrow, left, none, num, position, right, top, zero)
import CssShorthand exposing (batchMap, displayFlexColumn, marginRightLeft, marginTopBottom, paddingRightLeft, paddingTopBottom, willChangeTransform)
import Html.Styled exposing (Html, div, h1, styled, text)
import HtmlShorthand exposing (onClickPreventDefault)
import Model exposing (Model)
import Msg exposing (Msg(DetailsClose))
import View.Button as Button
import View.DetailsAnimation exposing (animateDetails)


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
            , position fixed
            , batchMap [ top, right, bottom, left ] zero
            , willChangeTransform
            , animateDetails model
            ]
    in
    styled div
        style
        [ onClickPreventDefault (always <| DetailsClose) ]
        [ viewContent ]


viewContent : Html Msg
viewContent =
    let
        style =
            [ Button.border
            , marginTopBottom <| em 5
            , marginRightLeft <| em 5
            , paddingTopBottom <| em 1
            , paddingRightLeft <| em 3
            , flexGrow <| num 1
            ]
    in
    styled div
        style
        []
        [ h1 [] [ text "Details" ] ]
