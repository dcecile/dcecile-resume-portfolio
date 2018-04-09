module View.Details
    exposing
        ( maybeViewDetails
        , subscribeDetails
        )

import Css exposing (Style, alignItems, backgroundColor, bold, borderRadius, borderWidth, bottom, capitalize, center, color, display, em, empty, fixed, flexBasis, flexEnd, flexGrow, fontSize, fontWeight, height, justifyContent, lastChild, left, lineHeight, marginBottom, marginLeft, marginRight, marginTop, maxWidth, none, num, padding, position, px, right, spaceBetween, textDecoration, textTransform, top, underline, vh, vw, zero)
import CssShorthand exposing (batchMap, borderSolidColor, displayFlexColumn, displayFlexRow, displayFlexRowReverse, marginRightLeft, marginTopBottom, mediaNotPrint, noStyle, paddingRightLeft, paddingTopBottom, textDecorationSkipInk, willChangeTransform, zIndexBackground, zIndexNormal, zIndexOverlay)
import Data.Details exposing (DetailsItemData)
import Display.Details exposing (DetailsAnimation(DetailsAnimationClose, DetailsAnimationNavigate), DetailsDisplay, DetailsDoubleBufferState(DetailsDoubleBufferFirstSlotNew, DetailsDoubleBufferFirstSlotOld), DetailsNavigateDirection(DetailsNavigateLink, DetailsNavigateNext, DetailsNavigatePrevious))
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
        , viewPrevious model item
        , viewContent model item
        , viewNext model item
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


viewPrevious : Model -> DetailsItemData -> Html Msg
viewPrevious =
    viewNavigateButton
        displayFlexRow
        DetailsNavigatePrevious
        "Previous"
        .previousName
        .chevronLeft


viewNext : Model -> DetailsItemData -> Html Msg
viewNext =
    viewNavigateButton
        displayFlexRowReverse
        DetailsNavigateNext
        "Next"
        .nextName
        .chevronRight


viewNavigateButton : Style -> DetailsNavigateDirection -> String -> (DetailsItemData -> Maybe String) -> IconBackground -> Model -> DetailsItemData -> Html Msg
viewNavigateButton displayStyle direction directionName linkNameSelector iconBackground model item =
    let
        iconSource =
            model.iconSource

        containerStyle =
            [ displayStyle
            , justifyContent flexEnd
            , flexBasis <| em 0
            , flexGrow <| num 1
            ]

        buttonStyle =
            [ Button.border
            , displayStyle
            , alignItems center
            , marginRightLeft <| em 1.4
            , backgroundColor white
            , padding <| em 0.5
            , color black
            , textDecoration none
            ]

        descriptionStyle =
            [ displayFlexColumn
            , fontSize <| em 0.7
            , marginRightLeft <| em 1
            , maxWidth <| em 11
            ]

        descriptionLinkStyle =
            [ color green
            , textDecoration underline
            , fontWeight bold
            ]

        viewButton linkName =
            styled a
                buttonStyle
                [ href "#"
                , onClickPreventDefault (always (DetailsNavigate direction linkName))
                ]
                [ iconSpan [] iconSource iconBackground
                , styled div
                    descriptionStyle
                    []
                    [ styledSpanText [] <|
                        String.concat
                            [ directionName
                            , " "
                            , item.noun
                            , ":"
                            ]
                    , styledSpanText descriptionLinkStyle linkName
                    ]
                ]
    in
    linkNameSelector item
        |> Maybe.map viewButton
        |> MaybeEx.toList
        |> styled span containerStyle []


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
            , flexBasis <| em 30
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
    [ item.homepageURL |> Maybe.map (viewLink iconSource "Homepage" .home)
    , item.sourceURL |> Maybe.map (viewLink iconSource "Source code" .github)
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
        , onClickPreventDefault (always (DetailsNavigate DetailsNavigateLink name))
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
                Maybe.map (DetailsNavigate DetailsNavigatePrevious) item.previousName
            else if keyCode == rightKeyCode then
                Maybe.map (DetailsNavigate DetailsNavigateNext) item.nextName
            else
                Nothing

        subscribe details =
            Keyboard.downs
                (handleKey details.itemData >> Maybe.withDefault NoMsg)

        maybeSubscribe details =
            case details.animation of
                DetailsAnimationClose ->
                    Nothing

                _ ->
                    Just (subscribe details)
    in
    model.details
        |> Maybe.andThen maybeSubscribe
        |> Maybe.withDefault Sub.none
