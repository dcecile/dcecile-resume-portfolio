module View.Resume
    exposing
        ( viewResume
        )

import Css exposing (Em, Style, batch, bold, borderRadius, borderWidth, center, color, em, flexBasis, flexEnd, flexGrow, flexWrap, fontSize, fontStyle, fontWeight, height, italic, justifyContent, lineHeight, marginBottom, marginLeft, marginRight, marginTop, none, normal, num, paddingBottom, paddingLeft, paddingTop, right, textAlign, textDecoration, width, wrap, zero)
import CssShorthand exposing (batchMap, borderBottomSolidColor, borderLeftSolidColor, borderSolidColor, displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom, noStyle, paddingRightLeft, paddingTopBottom, textDecorationSkipInk)
import Data.Links exposing (LinksItemData)
import Data.Projects exposing (ProjectsItemData)
import Data.Visibility exposing (Visibility(PortfolioAndResume), filterVisible)
import Data.Work exposing (WorkData, WorkItemData)
import Html.Styled exposing (Html, a, div, footer, h1, h2, h3, header, img, main_, nav, p, section, span, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (styledSpanText)
import Icon exposing (IconBackground, IconSource, iconImage)
import MarkedString exposing (MarkedString, MarkedSubstring(NormalSubstring, SpecialSubstring), markedString)
import Model exposing (Model)
import Msg exposing (Msg)
import Regex exposing (HowMany(All), regex, replace)
import View.Colors exposing (printBlack, printGreen, printPaleGreen)
import View.Metrics exposing (printBorderWidth, standardLineHeight)


viewResume : Model -> Html Msg
viewResume model =
    let
        style =
            [ displayFlexColumn
            , paddingTopBottom <| em 3.2
            , paddingRightLeft <| em 3.5
            , flexGrow <| num 1
            , lineHeight <| num standardLineHeight
            , color printBlack
            ]
    in
    styled div
        style
        []
        [ viewHeader model
        , viewHorizontalRule <| em 1.0
        , viewMain model
        , viewHorizontalRule <| em 0.5
        , viewFooter model
        ]


viewHeader : Model -> Html Msg
viewHeader model =
    let
        basicData =
            model.data.basic

        linksData =
            model.data.links

        style =
            [ displayFlexRow
            , marginBottom <| em 0.2
            ]
    in
    styled header
        style
        []
        [ viewPrimary
            model.iconSource
            basicData.name
            basicData.homepageURL
            basicData.resumeTagline
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
            , fontSize <| em 3.4
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
            [ marginTop <| em 0.5
            , marginBottom <| em 0.2
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
            , fontSize <| em 1.5
            , color printGreen
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


viewMain : Model -> Html Msg
viewMain model =
    let
        style =
            [ displayFlexRow
            , flexGrow <| num 1
            ]
    in
    styled main_
        style
        []
        [ viewInfo model
        , viewHistory model
        ]


viewInfo : Model -> Html Msg
viewInfo model =
    let
        style =
            [ displayFlexColumn
            , flexBasis <| em 0
            , flexGrow <| num 1
            , marginRight <| em 1.0
            ]
    in
    styled div
        style
        []
        [ viewTech model
        , viewProjects model
        , viewWork model "Volunteering" .resumeVolunteerItems True
        , viewEducation model
        ]


viewTech : Model -> Html Msg
viewTech model =
    viewSection "Proficiencies"
        [ viewItem True
            [ viewTechLine model
            ]
        ]


viewTechLine : Model -> Html Msg
viewTechLine model =
    let
        sectionData =
            model.data.tech

        style =
            [ marginTopBottom zero
            , marginRight <| em 0.2
            , lineHeight <| num 2.0
            , color printGreen
            ]
    in
    sectionData.items
        |> filterVisible PortfolioAndResume .visibility
        |> List.map (\item -> Maybe.withDefault item.name item.shortName)
        |> List.map viewTechLineItem
        |> List.intersperse (text " ")
        |> styled p style []


viewTechLineItem : String -> Html Msg
viewTechLineItem item =
    let
        style =
            [ marginRight <| em 0.1
            , borderSolidColor printPaleGreen
            , borderWidth printBorderWidth
            , borderRadius <| em 0.3
            , paddingTopBottom <| em 0.0
            , paddingRightLeft <| em 0.3
            ]
    in
    styled span
        style
        []
        [ text item ]


viewProjects : Model -> Html Msg
viewProjects model =
    let
        basicData =
            model.data.basic

        sectionData =
            model.data.projects
    in
    (viewSection "Side projects" << List.concat)
        [ sectionData.items
            |> filterVisible PortfolioAndResume .visibility
            |> List.map viewProjectsItem
        , basicData.homepageURL
            |> viewProjectsMore model.iconSource
            |> List.singleton
        ]


viewProjectsItem : ProjectsItemData -> Html Msg
viewProjectsItem item =
    viewItem True
        [ viewItemLine0
            [ viewItemName item.name
            , viewItemPeriod True item.period
            ]
        , viewItemLine1 True <|
            viewMarkedString
                [ SpecialSubstring item.tech
                , NormalSubstring <| " " ++ item.description
                ]
        ]


viewProjectsMore : IconSource -> String -> Html Msg
viewProjectsMore iconSource homepageURL =
    let
        style =
            [ marginTop zero
            , marginBottom <| em 0.6
            , marginLeft <| em 0.8
            , fontStyle italic
            ]
    in
    styled p
        style
        []
        [ text "…more at "
        , viewLink [] iconSource homepageURL Nothing .externalLink
        ]


viewEducation : Model -> Html Msg
viewEducation model =
    let
        sectionData =
            model.data.education
    in
    viewSection "Education"
        [ viewItem True
            [ viewItemLine0
                [ viewItemName sectionData.name
                , viewItemPeriod True sectionData.period
                ]
            , viewItemLine1 True
                [ viewItemTitle sectionData.specialization
                ]
            ]
        ]


viewHistory : Model -> Html Msg
viewHistory model =
    let
        style =
            [ displayFlexColumn
            , flexBasis <| em 0
            , flexGrow <| num 1.2
            ]
    in
    styled div
        style
        []
        [ viewWork model "Work history" .resumeItems False
        ]


viewWork : Model -> String -> (WorkData -> List WorkItemData) -> Bool -> Html Msg
viewWork model subheading itemsSelector narrow =
    let
        sectionData =
            model.data.work
    in
    itemsSelector sectionData
        |> List.map (viewWorkItem model.iconSource narrow)
        |> viewSection subheading


viewWorkItem : IconSource -> Bool -> WorkItemData -> Html Msg
viewWorkItem iconSource narrow item =
    (viewItem narrow << List.concat)
        [ viewWorkItemNameLocation iconSource item.name item.resumeLocation |> List.singleton
        , item.resumeTitlePeriods |> List.map (uncurry (viewWorkItemTitlePeriod narrow))
        , item.resumePoints |> List.map (viewWorkItemPoint narrow)
        ]


viewWorkItemNameLocation : IconSource -> String -> String -> Html Msg
viewWorkItemNameLocation iconSource name location =
    viewItemLine0
        [ viewItemName name
        , viewItemLocation iconSource location
        ]


viewWorkItemTitlePeriod : Bool -> String -> String -> Html Msg
viewWorkItemTitlePeriod narrow title period =
    viewItemLine1 narrow
        [ viewItemTitle title
        , viewItemPeriod narrow period
        ]


viewWorkItemPoint : Bool -> MarkedString -> Html Msg
viewWorkItemPoint narrow point =
    viewItemLine2 narrow <|
        viewMarkedString point


viewFooter : Model -> Html Msg
viewFooter model =
    let
        basicData =
            model.data.basic

        style =
            [ displayFlexColumn
            , justifyContent flexEnd
            , marginTop <| em 0.2
            , flexGrow <| num 1
            ]
    in
    styled footer
        style
        []
        [ viewSource
            model.iconSource
            basicData.sourceURL
            basicData.sourceShortURL
        ]


viewSource : IconSource -> String -> Maybe String -> Html Msg
viewSource iconSource sourceURL sourceShortURL =
    let
        style =
            [ marginTopBottom zero
            , textAlign center
            , fontStyle italic
            ]

        linkStyle =
            [ fontStyle normal
            ]
    in
    (styled p style [] << List.concat)
        [ viewMarkedString <| markedString "I made this resume with `Elm` and `CSS3`, view source at "
        , viewLink linkStyle iconSource sourceURL sourceShortURL .externalLink |> List.singleton
        ]



-- Elements


viewSubheading : String -> Html Msg
viewSubheading subheading =
    let
        style =
            [ marginTop zero
            , marginBottom <| em 0.1
            , fontSize <| em 1.8
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
viewLink customStyle iconSource url shortUrl iconBackground =
    let
        style =
            [ color printBlack
            , textDecorationSkipInk
            , batch customStyle
            ]

        trimProtocol =
            replace All (regex "^(?:https://|mailto:)") (always "")

        urlText =
            trimProtocol <| Maybe.withDefault url shortUrl
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
            [ marginRightLeft <| em 2
            , batchMap [ marginBottom, paddingBottom ] spacing
            , borderBottomSolidColor printPaleGreen
            , borderWidth printBorderWidth
            ]
    in
    styled div style [] []


viewItem : Bool -> List (Html Msg) -> Html Msg
viewItem narrow nodes =
    let
        style =
            [ displayFlexRow
            , marginTop zero
            , marginBottom <|
                em
                    (if narrow then
                        0.6
                     else
                        1.0
                    )
            ]

        innerStyle =
            [ displayFlexColumn
            ]

        verticalRuleStyle =
            [ marginTopBottom <| em 0.25
            , batchMap [ marginLeft, paddingLeft ] <| em 0.7
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


viewItemLine0 : List (Html Msg) -> Html Msg
viewItemLine0 =
    let
        style =
            [ marginTopBottom zero
            , fontSize <| em 1
            , fontWeight normal
            ]
    in
    styled h3 style []


viewItemLine1 : Bool -> List (Html Msg) -> Html Msg
viewItemLine1 narrow =
    let
        style =
            [ marginTopBottom zero
            , marginLeft <|
                em
                    (if narrow then
                        0.5
                     else
                        1.0
                    )
            ]
    in
    styled p style []


viewItemLine2 : Bool -> List (Html Msg) -> Html Msg
viewItemLine2 narrow =
    let
        style =
            [ marginTopBottom zero
            , marginLeft <|
                em
                    (if narrow then
                        1.0
                     else
                        2.0
                    )
            ]
    in
    styled p style []


viewItemName : String -> Html Msg
viewItemName =
    styledSpanText
        [ fontStyle italic
        ]


viewItemLocation : IconSource -> String -> Html Msg
viewItemLocation iconSource location =
    let
        style =
            [ marginLeft <| em 0.6
            , fontStyle italic
            ]
    in
    styled span
        style
        []
        [ viewIcon iconSource .mapPin
        , text location
        ]


viewItemPeriod : Bool -> String -> Html Msg
viewItemPeriod narrow =
    styledSpanText
        [ marginLeft <|
            em
                (if narrow then
                    0.6
                 else
                    0.8
                )
        ]


viewItemTitle : String -> Html Msg
viewItemTitle =
    styledSpanText
        [ fontWeight bold
        ]


viewMarkedString : MarkedString -> List (Html Msg)
viewMarkedString =
    let
        highlight =
            styledSpanText
                [ fontWeight bold
                , color printGreen
                ]
    in
    MarkedString.transform text highlight
