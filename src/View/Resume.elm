module View.Resume
    exposing
        ( viewResume
        )

import Css exposing (Style, batch, bold, borderWidth, center, color, em, flexBasis, flexGrow, fontSize, fontWeight, height, hex, lineHeight, marginBottom, marginTop, none, normal, num, paddingBottom, paddingTop, right, textAlign, textDecoration, width, zero)
import CssShorthand exposing (batchMap, borderBottomSolidColor, displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom, paddingRightLeft, paddingTopBottom, textDecorationSkipInk)
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
        style =
            [ displayFlexColumn
            , paddingTopBottom <| em 2.2
            , paddingRightLeft <| em 2.5
            , flexGrow <| num 1
            , lineHeight <| num standardLineHeight
            , color printBlack
            ]
    in
    styled div
        style
        []
        [ viewHeader model
        , viewHorizontalRule
        , viewMain
        , viewHorizontalRule
        , viewFooter model
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
            , marginBottom <| em 0.8
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
    styled div
        style
        []
        [ viewName name
        , viewHomepage iconSource homepageURL
        , viewTagline tagline
        ]


viewName : String -> Html Msg
viewName name =
    let
        style =
            [ marginTopBottom zero
            , lineHeight <| num 1.0
            , fontSize <| em 3.7
            , fontWeight bold
            ]
    in
    styled h1
        style
        []
        [ text name ]


viewHomepage : IconSource -> String -> Html Msg
viewHomepage iconSource homepageURL =
    let
        style =
            [ marginTop <| em 0.4
            , marginBottom <| em 0.3
            , fontSize <| em 1.5
            , fontWeight bold
            ]

        linkStyle =
            [ textDecoration none
            ]
    in
    styled p
        style
        []
        [ viewLink linkStyle iconSource homepageURL Nothing .externalLink ]


viewTagline : String -> Html Msg
viewTagline tagline =
    let
        style =
            [ marginTopBottom zero
            , fontSize <| em 1.3
            ]
    in
    styled p
        style
        []
        [ text tagline ]


viewContact : IconSource -> String -> List LinksItemData -> Html Msg
viewContact iconSource emailAddress links =
    let
        style =
            [ displayFlexColumn
            , marginTop <| em 0.3
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
    viewLink [] iconSource ("mailto:" ++ emailAddress) Nothing .mail


viewContactLink : IconSource -> LinksItemData -> Html Msg
viewContactLink iconSource link =
    viewLink [] iconSource link.url link.shortURL link.iconBackground


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
        [ viewSubheading "Proficiencies"
        , p [] []
        , viewSubheading "Side projects"
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , viewSubheading "Education"
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
        [ viewSubheading "Work history"
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , p [] []
        , viewSubheading "Volunteering"
        ]


viewFooter : Model -> Html Msg
viewFooter model =
    let
        basicData =
            model.data.basic

        resumeData =
            model.data.resume

        style =
            [ displayFlexColumn
            , marginTop <| em 0.2
            ]
    in
    styled footer
        style
        []
        [ viewSource
            model.iconSource
            basicData.sourceURL
            resumeData.sourceShortURL
        ]


viewSource : IconSource -> String -> Maybe String -> Html Msg
viewSource iconSource sourceURL sourceShortURL =
    let
        style =
            [ marginTopBottom zero
            , textAlign center
            , fontSize <| em 0.8
            ]
    in
    styled p
        style
        []
        [ text "This resume was made with Elm, view source at "
        , viewLink [] iconSource sourceURL sourceShortURL .externalLink
        ]


viewSubheading : String -> Html Msg
viewSubheading subheading =
    let
        style =
            [ marginTop <| em 0.2
            , marginBottom <| em 1.6
            , fontSize <| em 1.8
            , fontWeight normal
            ]
    in
    styled h2
        style
        []
        [ text subheading ]


viewLink : List Style -> IconSource -> String -> Maybe String -> IconBackground -> Html Msg
viewLink customStyle iconSource url shortUrl iconBackground =
    let
        style =
            [ color printBlack
            , textDecorationSkipInk
            , batch customStyle
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


viewHorizontalRule : Html msg
viewHorizontalRule =
    let
        style =
            [ marginRightLeft <| em 2
            , batchMap [ marginBottom, paddingBottom ] <| em 1.0
            , borderBottomSolidColor <| hex "#e4e4e4"
            , borderWidth <| em 0.02
            ]
    in
    styled div style [] []
