module View.Details
    exposing
        ( maybeViewDetails
        , subscribeDetails
        )

import Css exposing (Style, alignItems, backgroundColor, borderRadius, borderWidth, bottom, center, color, display, em, fixed, fontSize, justifyContent, lastChild, left, lineHeight, marginBottom, marginRight, marginTop, maxWidth, none, num, padding, position, px, right, spaceBetween, textDecoration, top, underline, vh, vw, zero)
import CssShorthand exposing (batchMap, borderSolidColor, displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom, mediaNotPrint, paddingRightLeft, paddingTopBottom, willChangeTransform, zIndexBackground)
import Data.Details exposing (DetailsItemData)
import Display.Details exposing (DetailsDisplay)
import Html.Styled exposing (Html, a, div, h1, li, p, span, styled, text, ul)
import Html.Styled.Attributes exposing (href, title)
import HtmlShorthand exposing (ariaLabel, onClickPreventDefault, styledSpanText, targetBlank)
import Icon exposing (IconBackground, IconSource, iconSpan)
import Keyboard
import MarkedString exposing (MarkedString, markedString)
import Model exposing (Model)
import Msg exposing (Msg(DetailsClose, NoMsg))
import View.Button as Button
import View.Colors exposing (black, blackLevel, extraPaleGreen, paleGreen, white)
import View.DetailsAnimation exposing (animateDetails)
import View.Metrics exposing (standardBorderRadius, standardLineHeight, standardScreenFontSize)


maybeViewDetails : Model -> Maybe (Html Msg)
maybeViewDetails model =
    model.details
        |> Maybe.map (viewDetails model)


viewDetails : Model -> DetailsDisplay -> Html Msg
viewDetails model details =
    let
        style =
            [ display none
            , mediaNotPrint [ displayFlexRow ]
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
        [ viewCloseBackground
        , viewNavPrevious model.iconSource
        , viewContent model details.itemData
        , viewNavNext model.iconSource
        ]


viewCloseBackground : Html Msg
viewCloseBackground =
    viewCloseLink
        ""
        [ zIndexBackground
        , position fixed
        , batchMap [ top, right, bottom, left ] zero
        ]
        []


viewCloseLink : String -> List Style -> List (Html Msg) -> Html Msg
viewCloseLink caption style =
    styled a
        style
        [ title caption
        , ariaLabel caption
        , href "#"
        , onClickPreventDefault (always DetailsClose)
        ]


viewNavPrevious : IconSource -> Html Msg
viewNavPrevious iconSource =
    viewNavButton iconSource "Previous" .arrowLeft


viewNavNext : IconSource -> Html Msg
viewNavNext iconSource =
    viewNavButton iconSource "Next" .arrowRight


viewNavButton : IconSource -> String -> IconBackground -> Html Msg
viewNavButton iconSource caption iconBackground =
    let
        style =
            [ Button.border
            , displayFlexRow
            , marginRightLeft <| em 1.4
            , backgroundColor white
            , padding <| em 0.7
            ]
    in
    styled a
        style
        [ title caption
        , ariaLabel caption
        , href "#"
        , onClickPreventDefault (always NoMsg)
        ]
        [ iconSpan [] iconSource iconBackground ]


viewContent : Model -> DetailsItemData -> Html Msg
viewContent model item =
    let
        style =
            [ Button.border
            , displayFlexColumn
            , marginTopBottom <| em 1
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
        [ viewHeader model.iconSource item.name
        , viewLinks model.iconSource
        , viewIntro item.intro
        , viewPoints item.points
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
    viewCloseLink
        "Close"
        [ marginTop <| em -0.1
        ]
        [ iconSpan [] iconSource .xSquare ]


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
viewLinkIcon =
    iconSpan [ marginRight <| em 0.3 ]


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


subscribeDetails : Model -> Sub Msg
subscribeDetails model =
    let
        escapeKeyCode =
            27

        handleKeyDown keyCode =
            if keyCode == escapeKeyCode then
                DetailsClose
            else
                NoMsg
    in
    case model.details of
        Just _ ->
            Keyboard.downs handleKeyDown

        Nothing ->
            Sub.none
