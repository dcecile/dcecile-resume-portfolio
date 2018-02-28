module View.Resume
    exposing
        ( viewResume
        )

import Css exposing (Style, batch, center, color, em, flexBasis, flexGrow, fontSize, height, lineHeight, marginBottom, num, padding2, right, textAlign, width)
import CssShorthand exposing (batchMap, displayFlexColumn, displayFlexRow, marginRightLeft, textDecorationSkipInk)
import Data.Links exposing (LinksItemData)
import Html.Styled exposing (Html, a, div, footer, h1, h2, header, img, main_, nav, p, section, span, styled, text)
import Html.Styled.Attributes exposing (href)
import Icon exposing (IconBackground, IconSource, iconImage)
import Model exposing (Model)
import Msg exposing (Msg)
import Regex exposing (HowMany(All), regex, replace)
import View.Colors exposing (printBlack)
import View.Metrics exposing (standardLineHeight)


viewResume : Model -> Html Msg
viewResume model =
    let
        basicData =
            model.data.basic

        resumeData =
            model.data.resume

        style =
            [ displayFlexColumn
            , padding2 (em 3) (em 3)
            , flexGrow <| num 1
            , lineHeight <| num standardLineHeight
            , color printBlack
            ]
    in
    styled header
        style
        []
        [ viewHeader model
        , viewMain
        , viewFooter
            model.iconSource
            basicData.sourceURL
            resumeData.sourceShortURL
        ]


viewHeader : Model -> Html Msg
viewHeader model =
    let
        basicData =
            model.data.basic

        resumeData =
            model.data.resume

        linksData =
            model.data.links

        style =
            [ displayFlexRow
            ]
    in
    styled header
        style
        []
        [ viewPrimary
            model.iconSource
            basicData.name
            resumeData.homepageURL
            resumeData.tagline
        , viewContact
            model.iconSource
            basicData.emailAddress
            linksData.resumeItems
        ]


viewPrimary : IconSource -> String -> String -> String -> Html Msg
viewPrimary iconSource name homepageURL tagline =
    let
        style =
            [ displayFlexColumn
            , flexGrow <| num 1
            ]
    in
    styled header
        style
        []
        [ h1 [] [ text name ]
        , p [] [ viewLink iconSource homepageURL Nothing .externalLink ]
        , p [] [ text tagline ]
        ]


viewContact : IconSource -> String -> List LinksItemData -> Html Msg
viewContact iconSource emailAddress links =
    let
        style =
            [ displayFlexColumn
            , textAlign right
            , lineHeight <| num 1.9
            ]
    in
    [ emailAddress |> viewContactEmail iconSource |> List.singleton
    , links |> List.map (viewContactLink iconSource)
    ]
        |> List.concat
        |> styled nav style []


viewContactEmail : IconSource -> String -> Html Msg
viewContactEmail iconSource emailAddress =
    viewLink iconSource emailAddress Nothing .mail


viewContactLink : IconSource -> LinksItemData -> Html Msg
viewContactLink iconSource link =
    viewLink iconSource link.url link.shortURL link.iconBackground


viewMain : Html Msg
viewMain =
    let
        style =
            [ displayFlexRow
            , flexGrow <| num 1
            ]
    in
    styled main_
        style
        []
        [ viewInfo
        , viewHistory
        ]


viewInfo : Html Msg
viewInfo =
    let
        style =
            [ displayFlexColumn
            , flexBasis <| em 0
            , flexGrow <| num 1
            ]
    in
    styled section
        style
        []
        [ h2 [] [ text "Proficiencies" ]
        , p [] []
        , h2 [] [ text "Side projects" ]
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , h2 [] [ text "Education" ]
        ]


viewHistory : Html Msg
viewHistory =
    let
        style =
            [ displayFlexColumn
            , flexBasis <| em 0
            , flexGrow <| num 1.4
            ]
    in
    styled section
        style
        []
        [ h2 [] [ text "Work history" ]
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , h2 [] [ text "Volunteering" ]
        ]


viewFooter : IconSource -> String -> Maybe String -> Html Msg
viewFooter iconSource sourceURL sourceShortURL =
    let
        style =
            [ textAlign center
            , fontSize <| em 0.8
            ]
    in
    styled footer
        style
        []
        [ text "This resume was made with Elm, view source at "
        , viewLink iconSource sourceURL sourceShortURL .externalLink
        ]


viewLink : IconSource -> String -> Maybe String -> IconBackground -> Html Msg
viewLink iconSource url shortUrl iconBackground =
    let
        style =
            [ color printBlack
            , textDecorationSkipInk
            ]

        urlText =
            trimProtocol <| Maybe.withDefault url shortUrl
    in
    styled a
        style
        [ href url ]
        [ text urlText
        , viewIcon iconSource iconBackground
        ]


trimProtocol : String -> String
trimProtocol =
    replace All (regex "^(?:https://|mailto:)") (always "")


viewIcon : IconSource -> IconBackground -> Html msg
viewIcon iconSource iconBackground =
    let
        style =
            [ batchMap [ width, height ] <| em 0.9
            , marginRightLeft <| em 0.3
            , marginBottom <| em -0.1
            ]
    in
    styled img
        style
        [ iconImage iconSource iconBackground ]
        []
