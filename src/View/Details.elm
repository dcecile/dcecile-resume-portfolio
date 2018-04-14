module View.Details
    exposing
        ( maybeSubscribeDetails
        , maybeViewDetails
        )

import Assets exposing (Assets)
import Css exposing (Style, alignItems, alignSelf, backgroundColor, bold, borderBox, borderRadius, borderWidth, bottom, boxShadow5, boxSizing, calc, capitalize, center, color, em, empty, fixed, flexBasis, flexEnd, flexGrow, flexShrink, flexWrap, fontSize, fontWeight, height, hidden, justifyContent, lastChild, left, lineHeight, marginBottom, marginLeft, marginRight, marginTop, maxHeight, maxWidth, minus, none, num, overflow, padding, paddingLeft, pct, position, px, right, spaceBetween, stretch, textDecoration, textTransform, top, underline, vh, vw, width, wrap, zero)
import CssShorthand exposing (batchMap, borderRightLeftSolidColor, borderSolidColor, displayFlexColumn, displayFlexRow, displayFlexRowReverse, displayNone, marginRightLeft, marginTopBottom, mediaNotPrint, noStyle, paddingRightLeft, paddingTopBottom, textDecorationSkipInk, willChangeTransform, zIndexBackground, zIndexNormal, zIndexOverlay)
import Data.Details exposing (DetailsItemData)
import Display exposing (Display)
import Display.Details exposing (DetailsAnimation(DetailsAnimationClose, DetailsAnimationNavigate), DetailsDisplay, DetailsDoubleBufferState(DetailsDoubleBufferFirstSlotNew, DetailsDoubleBufferFirstSlotOld), DetailsNavigateDirection(DetailsNavigateLink, DetailsNavigateNext, DetailsNavigatePrevious))
import Html.Styled exposing (Html, a, div, h1, li, p, span, styled, text, ul)
import Html.Styled.Attributes exposing (href, title)
import HtmlShorthand exposing (ariaLabel, onClickPreventDefault, styledSpanText, targetBlank)
import Icon exposing (IconBackground, IconSource, iconSpan)
import Keyboard
import MarkedString exposing (MarkedString, markedString)
import MaybeEx
import Msg exposing (Msg(DetailsClose, DetailsNavigate, NoMsg))
import View.Breakpoints exposing (breakpointDetailsLarge, breakpointDetailsMediumHeight, breakpointDetailsMediumWidth, breakpointDetailsSmallWidth)
import View.Button as Button
import View.Colors exposing (black, blackLevel, extraPaleGreen, green, paleGreen, white)
import View.DetailsAnimation exposing (animateDetails, animateDetailsItem)
import View.Metrics exposing (standardBorderRadius, standardBorderWidth, standardLineHeight, standardScreenFontSizeLarge, standardScreenFontSizeSmall)


maybeViewDetails : Assets -> Display -> Maybe (Html Msg)
maybeViewDetails assets display =
    display.details
        |> Maybe.map (viewDetails assets)


viewDetails : Assets -> DetailsDisplay -> Html Msg
viewDetails assets details =
    let
        style =
            [ displayNone
            , mediaNotPrint [ displayFlexColumn ]
            , position fixed
            , batchMap [ top, right, bottom, left ] zero
            , backgroundColor extraPaleGreen
            , fontSize standardScreenFontSizeSmall
            , breakpointDetailsLarge
                [ fontSize standardScreenFontSizeLarge
                ]
            , lineHeight <| num standardLineHeight
            , color black
            , willChangeTransform
            , animateDetails details
            ]
    in
    List.concatMap MaybeEx.toList
        [ maybeViewDetailsBuffer True assets details
        , maybeViewDetailsBuffer False assets details
        ]
        |> styled div style []


maybeViewDetailsBuffer : Bool -> Assets -> DetailsDisplay -> Maybe (Html Msg)
maybeViewDetailsBuffer isFirstBuffer assets details =
    let
        viewNew =
            Just <| viewDetailsItem True assets details details.itemData

        viewOld =
            Just << viewDetailsItem False assets details
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


viewDetailsItem : Bool -> Assets -> DetailsDisplay -> DetailsItemData -> Html Msg
viewDetailsItem isNew assets details item =
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
            , animateDetailsItem isNew details
            ]
    in
    styled div
        style
        []
        [ viewCloseBackground
        , viewPrevious assets item
        , viewContent assets item
        , viewNext assets item
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


viewPrevious : Assets -> DetailsItemData -> Html Msg
viewPrevious =
    viewNavigateButton
        displayFlexRow
        DetailsNavigatePrevious
        "Previous"
        .previousName
        .chevronLeft


viewNext : Assets -> DetailsItemData -> Html Msg
viewNext =
    viewNavigateButton
        displayFlexRowReverse
        DetailsNavigateNext
        "Next"
        .nextName
        .chevronRight


viewNavigateButton : Style -> DetailsNavigateDirection -> String -> (DetailsItemData -> Maybe String) -> IconBackground -> Assets -> DetailsItemData -> Html Msg
viewNavigateButton displayStyle direction directionName linkNameSelector iconBackground assets item =
    let
        iconSource =
            assets.iconSource

        containerStyle =
            [ displayNone
            , breakpointDetailsSmallWidth
                [ displayStyle
                ]
            , justifyContent flexEnd
            , flexBasis <| em 0
            , flexGrow <| num 1
            ]

        buttonStyle =
            [ Button.border
            , displayStyle
            , alignItems center
            , marginRightLeft <| em 0.9
            , breakpointDetailsMediumWidth
                [ marginRightLeft <| em 1.4
                ]
            , backgroundColor white
            , padding <| em 0.6
            , breakpointDetailsMediumWidth
                [ padding <| em 0.5
                ]
            , color black
            , textDecoration none
            ]

        descriptionStyle =
            [ displayNone
            , breakpointDetailsMediumWidth
                [ displayFlexColumn
                ]
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


viewContent : Assets -> DetailsItemData -> Html Msg
viewContent assets item =
    let
        style =
            [ Button.border
            , displayFlexColumn
            , alignSelf stretch
            , breakpointDetailsMediumHeight
                [ alignSelf center
                , marginTopBottom <| em 1
                ]
            , boxSizing borderBox
            , backgroundColor white
            , paddingTopBottom <| em 0.9
            , paddingRightLeft <| em 1.5
            , flexBasis <| em 30
            , maxHeight <| vh 100
            , fontSize <| em 0.8
            ]
    in
    styled div
        style
        []
        [ viewHeader assets.iconSource item.name item.capitalizeName
        , viewLinks assets.iconSource item
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
            , marginBottom <| em 0.2
            , breakpointDetailsMediumHeight
                [ marginBottom <| em 0.4
                ]
            , flexShrink <| num 0
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
            , empty [ displayNone ]
            , marginTop <| em -0.2
            , marginBottom <| em 0.5
            , breakpointDetailsMediumHeight
                [ marginTop <| em -0.3
                , marginBottom <| em 0.6
                ]
            , marginRightLeft <| em 0.2
            , flexShrink <| num 0
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
            , flexShrink <| num 0
            ]
    in
    viewMarkedString >> styled p style []


viewPoints : List MarkedString -> Html Msg
viewPoints points =
    let
        style =
            [ displayFlexColumn
            , flexWrap wrap
            , marginTop <| em 0.6
            , breakpointDetailsMediumHeight
                [ marginTop <| em 1.0
                ]
            , marginBottom zero
            , overflow hidden
            , paddingLeft zero
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
            [ marginTop zero
            , marginBottom <| em 0.6
            , breakpointDetailsMediumHeight
                [ marginBottom <| em 1.0
                ]
            , marginLeft <| em 1.6
            , width <| calc (pct 100) minus (em 1.6)
            , breakpointDetailsMediumHeight
                [ marginLeft <| em 1.8
                , width <| calc (pct 100) minus (em 1.8)
                ]
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


maybeSubscribeDetails : Display -> Maybe (Sub Msg)
maybeSubscribeDetails display =
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
    display.details
        |> Maybe.andThen maybeSubscribe
