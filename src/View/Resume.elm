module View.Resume
    exposing
        ( viewResume
        )

import Css exposing (Style, batch, bold, borderRadius, borderWidth, center, color, em, flexBasis, flexGrow, flexWrap, fontSize, fontStyle, fontWeight, height, italic, lineHeight, marginBottom, marginLeft, marginRight, marginTop, none, normal, num, paddingBottom, paddingLeft, paddingTop, right, textAlign, textDecoration, width, wrap, zero)
import CssShorthand exposing (batchMap, borderBottomSolidColor, borderLeftSolidColor, borderSolidColor, displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom, paddingRightLeft, paddingTopBottom, textDecorationSkipInk)
import Data.Links exposing (LinksItemData)
import Data.Projects exposing (ProjectsItemData)
import Data.Visibility exposing (Visibility(PortfolioAndResume), filterVisible)
import Data.Work exposing (WorkData, WorkItemData)
import Html.Styled exposing (Html, a, div, footer, h1, h2, h3, header, img, main_, nav, p, section, span, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (styledSpanText)
import Icon exposing (IconBackground, IconSource, iconImage)
import MarkedString exposing (MarkedString)
import Model exposing (Model)
import Msg exposing (Msg)
import Regex exposing (HowMany(All), regex, replace)
import View.Colors exposing (printBlack, printPaleGreen, printGreen)
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
        , viewHorizontalRule
        , viewMain model
        , viewHorizontalRule
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
            , marginBottom <| em 0.4
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
            [ marginTop <| em 0.5
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
            , marginTop <| em 0.1
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
    styled section
        style
        []
        [ viewSubheading "Proficiencies"
        , viewTech model
        , viewSubheading "Side projects"
        , viewProjects model
        , viewSubheading "Volunteering"
        , viewWork model .resumeVolunteerItems True
        , viewSubheading "Education"
        , viewEducation model
        ]


viewTech : Model -> Html Msg
viewTech model =
    let
        sectionData =
            model.data.tech

        style =
            [ viewVerticalRule
            , marginTop <| em 0.2
            , marginRight <| em 0.2
            , marginBottom <| em 0.6
            , lineHeight <| num 2.0
            , color printGreen
            ]
    in
    sectionData.items
        |> filterVisible PortfolioAndResume .visibility
        |> List.map .name
        |> List.map viewTechItem
        |> List.intersperse (text " ")
        |> styled p style []


viewTechItem : String -> Html Msg
viewTechItem item =
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

        style =
            [ displayFlexColumn
            ]
    in
    [ sectionData.items
        |> filterVisible PortfolioAndResume .visibility
        |> List.map viewProjectsItem
    , basicData.homepageURL
        |> viewProjectsMore model.iconSource
        |> List.singleton
    ]
        |> List.concat
        |> styled div style []


viewProjectsItem : ProjectsItemData -> Html Msg
viewProjectsItem item =
    let
        style =
            [ viewVerticalRule
            , displayFlexColumn
            , marginTop zero
            , marginBottom <| em 0.6
            ]
    in
    styled p
        style
        []
        [ viewProjectsItemNamePeriod item.name item.period
        , viewProjectsItemTechDescription item.tech item.description
        ]


viewProjectsItemNamePeriod : String -> String -> Html Msg
viewProjectsItemNamePeriod name period =
    let
        style =
            [ marginTopBottom zero
            , fontSize <| em 1
            , fontWeight normal
            ]

        nameStyle =
            [ fontStyle italic
            ]

        periodStyle =
            [ marginLeft <| em 0.6
            ]
    in
    styled h3
        style
        []
        [ styledSpanText nameStyle name
        , styledSpanText periodStyle period
        ]


viewProjectsItemTechDescription : String -> String -> Html Msg
viewProjectsItemTechDescription tech description =
    let
        style =
            [ marginLeft <| em 0.5
            ]

        techStyle =
            [ fontWeight bold
            , color printGreen
            ]
    in
    styled span
        style
        []
        [ styledSpanText techStyle tech
        , text <| " " ++ description
        ]


viewProjectsMore : IconSource -> String -> Html Msg
viewProjectsMore iconSource homepageURL =
    let
        style =
            [ marginTop zero
            , marginBottom <| em 0.6
            , marginLeft <| em 0.8
            , fontSize <| em 1.0
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

        style =
            [ viewVerticalRule
            , displayFlexColumn
            , marginTop zero
            , marginBottom <| em 0.6
            ]
    in
    styled p
        style
        []
        [ viewEducationLocationPeriod
            sectionData.location
            sectionData.period
        , viewEducationName
            sectionData.name
        ]


viewEducationLocationPeriod : String -> String -> Html Msg
viewEducationLocationPeriod location period =
    let
        style =
            [ marginTopBottom zero
            , fontSize <| em 1
            , fontWeight normal
            ]

        locationStyle =
            [ fontStyle italic
            ]

        periodStyle =
            [ marginLeft <| em 0.6
            ]
    in
    styled span
        style
        []
        [ styledSpanText locationStyle location
        , styledSpanText periodStyle period
        ]


viewEducationName : String -> Html Msg
viewEducationName =
    styledSpanText
        [ marginLeft <| em 0.5
        , fontWeight bold
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
    styled section
        style
        []
        [ viewSubheading "Work history"
        , viewWork model .resumeItems False
        ]


viewWork : Model -> (WorkData -> List WorkItemData) -> Bool -> Html Msg
viewWork model itemsSelector narrow =
    let
        sectionData =
            model.data.work

        style =
            [ displayFlexColumn
            ]
    in
    itemsSelector sectionData
        |> List.map (viewWorkItem model.iconSource narrow)
        |> styled div style []


viewWorkItem : IconSource -> Bool -> WorkItemData -> Html Msg
viewWorkItem iconSource narrow item =
    let
        style =
            [ viewVerticalRule
            , displayFlexColumn
            , marginTop zero
            , marginBottom <|
                em
                    (if narrow then
                        0.6
                     else
                        1.0
                    )
            ]
    in
    [ viewWorkItemNameLocation iconSource item.name item.resumeLocation |> List.singleton
    , item.resumeTitlePeriods |> List.map (uncurry (viewWorkItemTitlePeriod narrow))
    , item.resumePoints |> List.map (viewWorkItemPoint narrow)
    ]
        |> List.concat
        |> styled p style []


viewWorkItemNameLocation : IconSource -> String -> String -> Html Msg
viewWorkItemNameLocation iconSource name location =
    let
        style =
            [ marginTopBottom zero
            , fontSize <| em 1
            , fontWeight normal
            , fontStyle italic
            ]
    in
    styled h3
        style
        []
        [ text name
        , viewWorkItemLocation iconSource location
        ]


viewWorkItemLocation : IconSource -> String -> Html Msg
viewWorkItemLocation iconSource location =
    let
        style =
            [ marginLeft <| em 0.6
            ]
    in
    styled span
        style
        []
        [ viewIcon iconSource .mapPin
        , text location
        ]


viewWorkItemTitlePeriod : Bool -> String -> String -> Html Msg
viewWorkItemTitlePeriod narrow title period =
    let
        style =
            [ marginLeft <|
                em
                    (if narrow then
                        0.5
                     else
                        1.0
                    )
            ]
    in
    styled span
        style
        []
        [ viewWorkItemTitle title
        , viewWorkItemPeriod narrow period
        ]


viewWorkItemTitle : String -> Html Msg
viewWorkItemTitle title =
    let
        style =
            [ fontWeight bold
            ]
    in
    styled span
        style
        []
        [ text title ]


viewWorkItemPeriod : Bool -> String -> Html Msg
viewWorkItemPeriod narrow period =
    let
        style =
            [ marginLeft <|
                em
                    (if narrow then
                        0.6
                     else
                        0.8
                    )
            ]
    in
    styled span
        style
        []
        [ text period ]


viewWorkItemPoint : Bool -> MarkedString -> Html Msg
viewWorkItemPoint narrow point =
    let
        style =
            [ marginLeft <|
                em
                    (if narrow then
                        1.0
                     else
                        2.0
                    )
            ]

        highlight =
            styledSpanText
                [ fontWeight bold
                , color printGreen
                ]
    in
    point
        |> MarkedString.transform text highlight
        |> styled span style []


viewFooter : Model -> Html Msg
viewFooter model =
    let
        basicData =
            model.data.basic

        style =
            [ displayFlexColumn
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
            ]

        techStyle =
            [ fontWeight bold
            , color printGreen
            ]
    in
    styled p
        style
        []
        [ text "This resume was made with "
        , styledSpanText techStyle "Elm"
        , text ", view source at "
        , viewLink [] iconSource sourceURL sourceShortURL .externalLink
        ]


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
            , borderBottomSolidColor printPaleGreen
            , borderWidth printBorderWidth
            ]
    in
    styled div style [] []


viewVerticalRule : Style
viewVerticalRule =
    batch
        [ batchMap [ marginLeft, paddingLeft ] <| em 0.7
        , borderLeftSolidColor printPaleGreen
        , borderWidth printBorderWidth
        ]
