module View.Resume exposing
    ( viewResume
    , viewResumePageName
    , viewResumePrintName
    )

import Assets exposing (Assets)
import Char
import Css exposing (Color, Em, Style, absolute, alignItems, baseline, batch, bold, borderRadius, borderWidth, center, color, em, flexBasis, flexEnd, flexGrow, flexShrink, fontSize, fontStyle, fontWeight, height, hidden, italic, justifyContent, lastOfType, letterSpacing, lineHeight, marginBottom, marginLeft, marginRight, marginTop, noWrap, normal, num, opacity, overflow, paddingBottom, paddingLeft, paddingTop, position, right, textAlign, whiteSpace, width, zero)
import CssShorthand exposing (batchMap, beforeText, borderBottomSolidColor, borderLeftSolidColor, borderSolidColor, displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom, paddingRightLeft, textDecorationSkipInk, wordBreakBreakAll)
import Data exposing (Data)
import Data.Links exposing (LinksItemData)
import Data.Visibility exposing (ResumeVariant, filterResumeVisible)
import Data.Work exposing (WorkData, WorkItemData)
import Html.Styled exposing (Html, a, div, footer, h1, h2, h3, header, img, main_, nav, p, section, span, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (styledSpanText)
import Icon exposing (IconBackground, IconSource, iconImage)
import MarkedString exposing (MarkedString, MarkedSubstring(..), markedString)
import Msg exposing (Msg)
import Regex
import View.Colors exposing (printBlack, printGreen, printPaleGreen)
import View.Metrics exposing (printBorderWidth, printLineHeight)


resumeVariant : ResumeVariant
resumeVariant =
    Data.Visibility.GeneralResume


viewResume : Assets -> Data -> Html Msg
viewResume assets data =
    let
        style =
            [ displayFlexColumn
            , paddingTop <| em 2.8
            , paddingBottom <| em 2.1
            , paddingRightLeft <| em 3.8
            , flexGrow <| num 1
            , lineHeight <| num printLineHeight
            , color printBlack
            ]
    in
    styled div
        style
        []
        [ viewHeader assets data
        , viewHorizontalRule <| em 0.6
        , viewMain data
        , viewFooter assets data
        ]


viewHeader : Assets -> Data -> Html Msg
viewHeader assets data =
    let
        basicData =
            data.basic

        linksData =
            data.links

        style =
            [ displayFlexRow
            , marginBottom <| em 0.3
            ]
    in
    styled header
        style
        []
        [ viewPrimary
            assets.iconSource
            basicData.name
            basicData.pronouns
            basicData.homepageURL
            basicData.tagline
        , viewContact
            assets.iconSource
            basicData.emailAddress
            linksData.resumeItems
            basicData.currentLocation
        ]


viewPrimary : IconSource -> String -> String -> String -> String -> Html Msg
viewPrimary iconSource name pronouns homepageURL tagline =
    let
        style =
            [ displayFlexColumn
            , flexGrow <| num 1
            ]
    in
    styled div
        style
        []
        [ viewName name pronouns
        , viewTagline tagline
        , viewHomepage iconSource homepageURL
        ]


viewName : String -> String -> Html Msg
viewName name pronouns =
    let
        style =
            [ marginTopBottom zero
            , lineHeight <| num 1.0
            , fontSize <| em 2.4
            , fontWeight bold
            ]

        pronounsStyle =
            [ fontSize <| em 0.6
            , fontWeight normal
            , opacity <| num 0.5
            ]
    in
    styled h1
        style
        []
        [ text name
        , text " "
        , styled span
            pronounsStyle
            []
            [ text pronouns ]
        ]


viewTagline : String -> Html Msg
viewTagline tagline =
    let
        style =
            [ marginTop <| em 0.6
            , marginBottom <| em 0.1
            , fontSize <| em 1.1
            , fontWeight bold
            , color printGreen
            ]
    in
    styled p
        style
        []
        [ text tagline ]


viewHomepage : IconSource -> String -> Html Msg
viewHomepage iconSource homepageURL =
    let
        style =
            [ marginTopBottom zero
            , fontSize <| em 0.9
            , fontStyle italic
            ]

        linkStyle =
            [ fontStyle normal
            ]
    in
    styled p
        style
        []
        [ text "View my portfolio website at "
        , viewLink linkStyle iconSource homepageURL Nothing .externalLink
        ]


viewContact : IconSource -> String -> List LinksItemData -> String -> Html Msg
viewContact iconSource emailAddress links currentLocation =
    let
        style =
            [ displayFlexColumn
            , justifyContent center
            , marginTop <| em 0.3
            , textAlign right
            , fontSize <| em 0.9
            , lineHeight <| num 1.6
            ]
    in
    [ emailAddress |> viewContactEmail iconSource |> List.singleton
    , links |> List.map (viewContactLink iconSource)
    , currentLocation |> viewContactLocation iconSource |> List.singleton
    ]
        |> List.concat
        |> styled nav style []


viewContactEmail : IconSource -> String -> Html Msg
viewContactEmail iconSource emailAddress =
    viewLink [] iconSource ("mailto:" ++ emailAddress) Nothing .mail


viewContactLink : IconSource -> LinksItemData -> Html Msg
viewContactLink iconSource link =
    viewLink [] iconSource link.url link.shortURL link.iconBackground


viewContactLocation : IconSource -> String -> Html Msg
viewContactLocation iconSource location =
    let
        style =
            []
    in
    styled span
        style
        []
        [ text location
        , viewIcon iconSource .mapPin
        ]


viewMain : Data -> Html Msg
viewMain data =
    let
        style =
            [ displayFlexColumn
            , flexGrow <| num 1
            ]
    in
    styled main_
        style
        []
        [ viewIntro data
        , viewTechSkills data
        , viewWork data .resumeItems
        , viewStartupSkills data
        , viewEducation data
        ]


viewIntro : Data -> Html Msg
viewIntro data =
    let
        sectionData =
            data.basic

        style =
            [ marginBottom <| em 0.6
            ]

        highlightStyle =
            [ fontWeight bold
            ]
    in
    (styled section style [] << List.concat)
        [ sectionData.resumeIntro
            |> MarkedString.transform text (styledSpanText highlightStyle)
        ]


viewTechSkills : Data -> Html Msg
viewTechSkills data =
    let
        sectionData =
            data.tech

        skills =
            sectionData.items
                |> filterResumeVisible resumeVariant .visibility
                |> List.map (\item -> Maybe.withDefault item.name item.shortName)
    in
    viewSection sectionData.name
        [ viewItem
            [ viewSkillsLine printGreen printPaleGreen skills
            ]
        ]


viewStartupSkills : Data -> Html Msg
viewStartupSkills data =
    let
        sectionData =
            data.startup

        skills =
            sectionData.items
    in
    viewSection sectionData.name
        [ viewItem
            [ viewSkillsLine printGreen printPaleGreen skills
            ]
        ]


viewSkillsLine : Color -> Color -> List String -> Html Msg
viewSkillsLine textColor borderColor skills =
    let
        style =
            [ marginTopBottom zero
            , marginRight <| em 0.2
            , lineHeight <| num 2.1
            , color textColor
            ]
    in
    skills
        |> List.map (viewSkillsLineItem borderColor)
        |> List.intersperse (text " ")
        |> styled p style []


viewSkillsLineItem : Color -> String -> Html Msg
viewSkillsLineItem borderColor item =
    let
        style =
            [ marginRight <| em 0.25
            , borderSolidColor borderColor
            , borderWidth printBorderWidth
            , borderRadius <| em 0.3
            , paddingTop <| zero
            , paddingBottom <| em 0.1
            , paddingRightLeft <| em 0.4
            , whiteSpace noWrap
            ]
    in
    styled span
        style
        []
        [ text item ]


viewEducation : Data -> Html Msg
viewEducation data =
    let
        sectionData =
            data.education
    in
    viewSection "Education"
        [ viewItem
            [ viewItemLineFlex0
                [ styledSpanText [] <| sectionData.name ++ " / " ++ sectionData.specialization
                ]
            ]
        ]


viewWork : Data -> (WorkData -> List WorkItemData) -> Html Msg
viewWork data itemsSelector =
    let
        sectionData =
            data.work
    in
    itemsSelector sectionData
        |> List.map viewWorkItem
        |> viewSection sectionData.name


viewWorkItem : WorkItemData -> Html Msg
viewWorkItem item =
    (viewItem << List.concat)
        [ viewWorkItemNameTitlePeriod item.name item.resumeTitle item.resumePeriod |> List.singleton
        , item.resumePoints |> List.map viewWorkItemPoint
        ]


viewWorkItemNameTitlePeriod : String -> String -> String -> Html Msg
viewWorkItemNameTitlePeriod name title period =
    viewItemLineFlex0
        [ viewItemName <| name ++ " / " ++ title
        , viewItemDots
        , viewItemPeriod period
        ]


viewWorkItemPoint : MarkedString -> Html Msg
viewWorkItemPoint point =
    viewItemLine2 <|
        viewMarkedString point


viewFooter : Assets -> Data -> Html Msg
viewFooter assets data =
    let
        basicData =
            data.basic

        style =
            [ displayFlexColumn
            , justifyContent flexEnd
            , flexGrow <| num 1
            ]
    in
    styled footer
        style
        []
        [ viewSource
            assets.iconSource
            basicData.sourceURL
            basicData.sourceShortURL
        ]


viewSource : IconSource -> String -> Maybe String -> Html Msg
viewSource iconSource sourceURL sourceShortURL =
    let
        style =
            [ marginTopBottom zero
            , textAlign right
            , fontStyle italic
            , fontSize <| em 0.8
            , opacity <| num 0.5
            ]

        linkStyle =
            [ fontStyle normal
            ]

        highlightStyle =
            [ color printGreen
            ]
    in
    (styled p style [] << List.concat)
        [ markedString "This resume was created with `Elm` and `CSS` — view source at "
            |> MarkedString.transform text (styledSpanText highlightStyle)
        , viewLink linkStyle iconSource sourceURL sourceShortURL .externalLink
            |> List.singleton
        ]


viewSubheading : String -> Html Msg
viewSubheading subheading =
    let
        style =
            [ marginTop zero
            , marginBottom <| em 0.05
            , fontSize <| em 1.2
            , fontWeight bold
            ]
    in
    styled h2
        style
        []
        [ text subheading ]


viewSection : String -> List (Html Msg) -> Html Msg
viewSection subheading nodes =
    let
        style =
            [ displayFlexColumn
            ]
    in
    (styled section style [] << List.concat)
        [ viewSubheading subheading |> List.singleton
        , nodes
        ]


viewLink : List Style -> IconSource -> String -> Maybe String -> IconBackground -> Html Msg
viewLink customStyle iconSource url shortURL iconBackground =
    let
        style =
            [ color printBlack
            , textDecorationSkipInk
            , batch customStyle
            ]

        trimProtocol =
            Regex.replace (Maybe.withDefault Regex.never (Regex.fromString "^(?:https://|mailto:)")) (always "")

        urlText =
            trimProtocol <| Maybe.withDefault url shortURL
    in
    styled a
        style
        [ href url ]
        [ text urlText
        , viewIcon iconSource iconBackground
        ]


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


viewHorizontalRule : Em -> Html msg
viewHorizontalRule spacing =
    let
        style =
            [ marginRightLeft <| em 0.6
            , batchMap [ marginBottom, paddingBottom ] spacing
            , borderBottomSolidColor printPaleGreen
            , borderWidth printBorderWidth
            ]
    in
    styled div style [] []


viewItem : List (Html Msg) -> Html Msg
viewItem nodes =
    let
        style =
            [ displayFlexRow
            , marginTop zero
            , marginBottom <| em 0.4
            , lastOfType
                [ marginBottom <| em 0.6
                ]
            ]

        innerStyle =
            [ displayFlexColumn
            , flexGrow <| num 1
            ]

        verticalRuleStyle =
            [ marginTopBottom <| em 0.25
            , marginLeft <| em 0.4
            , paddingLeft <| em 0.8
            , borderLeftSolidColor printPaleGreen
            , borderWidth printBorderWidth
            ]
    in
    styled div
        style
        []
        [ styled div verticalRuleStyle [] []
        , styled div innerStyle [] nodes
        ]


viewItemLineFlex0 : List (Html Msg) -> Html Msg
viewItemLineFlex0 =
    let
        style =
            [ displayFlexRow
            , alignItems baseline
            , marginTopBottom zero
            , fontSize <| em 1
            , fontWeight normal
            ]
    in
    styled h3 style []


viewItemLine2 : List (Html Msg) -> Html Msg
viewItemLine2 =
    let
        style =
            [ marginTopBottom zero
            , marginLeft <| em 1.0
            , viewItemLineBulletStyle
            ]
    in
    styled p style []


viewItemLineBulletStyle : Style
viewItemLineBulletStyle =
    beforeText
        "-"
        [ position absolute
        , marginTop zero
        , marginLeft <| em -0.8
        , color printGreen
        ]


viewItemName : String -> Html Msg
viewItemName =
    styledSpanText
        [ fontWeight bold
        ]


viewItemPeriod : String -> Html Msg
viewItemPeriod =
    styledSpanText
        [ fontWeight bold
        ]


viewItemDots : Html Msg
viewItemDots =
    let
        style =
            [ overflow hidden
            , opacity <| num 0.8
            , displayFlexRow
            , alignItems baseline
            , flexBasis <| em 0
            , flexGrow <| num 1
            , height <| em (printLineHeight - 0.1)
            , wordBreakBreakAll
            , textAlign center
            , letterSpacing <| em 0.05
            , color <| printPaleGreen
            ]
    in
    styled span
        style
        []
        [ viewItemDotsMargin
        , text <| String.repeat 80 ("." ++ String.fromChar (Char.fromCode 0x2009))
        , viewItemDotsMargin
        ]


viewItemDotsMargin : Html Msg
viewItemDotsMargin =
    styledSpanText
        [ flexBasis <| em 0.6
        , flexShrink <| num 0.2
        ]
        ""


viewMarkedString : MarkedString -> List (Html Msg)
viewMarkedString =
    let
        highlightStyle =
            [ fontWeight bold
            , color printGreen
            ]
    in
    MarkedString.transform text (styledSpanText highlightStyle)


viewResumePageName : Data -> String
viewResumePageName data =
    data.basic.name ++ "’s resume"


viewResumePrintName : Data -> String
viewResumePrintName data =
    String.replace " " "_" data.basic.name ++ "_resume"
