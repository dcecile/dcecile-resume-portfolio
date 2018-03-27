module View.Details
    exposing
        ( maybeViewDetails
        , subscribeDetails
        )

import Css exposing (Style, alignItems, backgroundColor, batch, bold, borderRadius, borderWidth, bottom, capitalize, center, color, display, em, empty, fixed, fontSize, fontWeight, height, hidden, justifyContent, lastChild, left, lineHeight, marginBottom, marginLeft, marginRight, marginTop, maxWidth, minWidth, none, num, padding, position, px, right, spaceBetween, textDecoration, textTransform, top, underline, vh, visibility, vw, zero)
import CssShorthand exposing (batchMap, borderSolidColor, displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom, mediaNotPrint, noStyle, paddingRightLeft, paddingTopBottom, textDecorationSkipInk, willChangeTransform, zIndexBackground, zIndexNormal, zIndexOverlay)
import Data.Details exposing (DetailsItemData)
import Display.Details exposing (DetailsAnimation(DetailsAnimationNavigate), DetailsDisplay, DetailsDoubleBufferState(DetailsDoubleBufferFirstSlotNew, DetailsDoubleBufferFirstSlotOld))
import Html.Styled exposing (Html, a, div, h1, li, p, span, styled, text, ul)
import Html.Styled.Attributes exposing (href, title)
import HtmlShorthand exposing (ariaLabel, onClickPreventDefault, styledSpanText, targetBlank)
import Icon exposing (IconBackground, IconSource, iconSpan)
import Keyboard
import MarkedString exposing (MarkedString, markedString)
import MaybeEx
import Model exposing (Model)
import Msg exposing (Msg(DetailsClose, DetailsNavigate, NoMsg))
import View.Button as Button
import View.Colors exposing (black, blackLevel, extraPaleGreen, green, paleGreen, white)
import View.DetailsAnimation exposing (animateDetails, animateDetailsItem)
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
            , mediaNotPrint [ displayFlexColumn ]
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
    List.concatMap MaybeEx.toList
        [ maybeViewDetailsBuffer True model details
        , maybeViewDetailsBuffer False model details
        ]
        |> styled div style []


maybeViewDetailsBuffer : Bool -> Model -> DetailsDisplay -> Maybe (Html Msg)
maybeViewDetailsBuffer isFirstBuffer model details =
    let
        viewNew =
            Just <| viewDetailsItem True model details details.itemData

        viewOld =
            Just << viewDetailsItem False model details
    in
    case ( isFirstBuffer, details.doubleBufferState, details.animation ) of
        ( True, DetailsDoubleBufferFirstSlotNew, _ ) ->
            viewNew

        ( False, DetailsDoubleBufferFirstSlotOld, _ ) ->
            viewNew

        ( True, DetailsDoubleBufferFirstSlotOld, DetailsAnimationNavigate { oldItemData } ) ->
            viewOld oldItemData

        ( False, DetailsDoubleBufferFirstSlotNew, DetailsAnimationNavigate { oldItemData } ) ->
            viewOld oldItemData

        _ ->
            Nothing


viewDetailsItem : Bool -> Model -> DetailsDisplay -> DetailsItemData -> Html Msg
viewDetailsItem isNew model details item =
    let
        style =
            [ if isNew then
                zIndexOverlay
              else
                zIndexNormal
            , displayFlexRow
            , justifyContent center
            , alignItems center
            , marginBottom <| vh -100
            , height <| vh 100
            , willChangeTransform
            , animateDetailsItem isNew model
            ]
    in
    styled div
        style
        []
        [ viewCloseBackground
        , viewPrevious model.iconSource item.previousName
        , viewContent model item
        , viewNext model.iconSource item.nextName
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


viewPrevious : IconSource -> Maybe String -> Html Msg
viewPrevious iconSource =
    viewNavigateButton iconSource .arrowLeft


viewNext : IconSource -> Maybe String -> Html Msg
viewNext iconSource =
    viewNavigateButton iconSource .arrowRight


viewNavigateButton : IconSource -> IconBackground -> Maybe String -> Html Msg
viewNavigateButton iconSource iconBackground maybeLinkName =
    let
        style =
            [ Button.border
            , displayFlexRow
            , marginRightLeft <| em 1.4
            , backgroundColor white
            , padding <| em 0.7
            ]

        hiddenStyle =
            [ batch style
            , visibility hidden
            ]
    in
    case maybeLinkName of
        Just linkName ->
            styled a
                style
                [ title linkName
                , ariaLabel linkName
                , href "#"
                , onClickPreventDefault (always (DetailsNavigate linkName))
                ]
                [ iconSpan [] iconSource iconBackground ]

        Nothing ->
            styled a
                hiddenStyle
                []
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
            , minWidth <| em 20
            , maxWidth <| em 30
            , fontSize <| em 0.8
            ]
    in
    styled div
        style
        []
        [ viewHeader model.iconSource item.name item.capitalizeName
        , viewLinks model.iconSource item
        , viewIntro item.intro
        , viewPoints item.points
        ]


viewHeader : IconSource -> String -> Bool -> Html Msg
viewHeader iconSource headerText capitalizeName =
    let
        style =
            [ displayFlexRow
            , justifyContent spaceBetween
            , alignItems top
            , fontSize <| em 1.6
            , if capitalizeName then
                textTransform capitalize
              else
                noStyle
            , marginTop zero
            , marginBottom <| em 0.4
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
        , marginLeft <| em 1.0
        ]
        [ iconSpan [] iconSource .xSquare ]


viewLinks : IconSource -> DetailsItemData -> Html Msg
viewLinks iconSource item =
    let
        style =
            [ displayFlexRow
            , empty [ display none ]
            , marginTop <| em -0.3
            , marginBottom <| em 0.6
            , marginRightLeft <| em 0.2
            ]
    in
    [ item.homepageUrl |> Maybe.map (viewLink iconSource "Homepage" .home)
    , item.sourceUrl |> Maybe.map (viewLink iconSource "Source code" .github)
    ]
        |> List.concatMap MaybeEx.toList
        |> styled p style []


viewLink : IconSource -> String -> IconBackground -> String -> Html Msg
viewLink iconSource linkText iconBackground url =
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
        [ href url
        , targetBlank
        ]
        [ viewLinkIcon iconSource iconBackground
        , text linkText
        ]


viewLinkIcon : IconSource -> IconBackground -> Html Msg
viewLinkIcon =
    iconSpan [ marginRight <| em 0.3 ]


viewIntro : MarkedString -> Html Msg
viewIntro =
    let
        style =
            [ marginTopBottom zero
            ]
    in
    viewMarkedString >> styled p style []


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
    viewMarkedString >> styled li style []


viewMarkedString : MarkedString -> List (Html Msg)
viewMarkedString =
    MarkedString.transform text viewNavigateLink


viewNavigateLink : String -> Html Msg
viewNavigateLink name =
    let
        style =
            [ color green
            , fontWeight bold
            , textDecorationSkipInk
            ]
    in
    styled a
        style
        [ href "#"
        , onClickPreventDefault (always (DetailsNavigate name))
        ]
        [ text name ]


subscribeDetails : Model -> Sub Msg
subscribeDetails model =
    let
        ( escapeKeyCode, leftKeyCode, rightKeyCode ) =
            ( 27, 37, 39 )

        handleKey item keyCode =
            if keyCode == escapeKeyCode then
                Just DetailsClose
            else if keyCode == leftKeyCode then
                Maybe.map DetailsNavigate item.previousName
            else if keyCode == rightKeyCode then
                Maybe.map DetailsNavigate item.nextName
            else
                Nothing
    in
    case model.details of
        Just details ->
            Keyboard.downs
                (handleKey details.itemData >> Maybe.withDefault NoMsg)

        Nothing ->
            Sub.none
