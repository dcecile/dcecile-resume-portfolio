module View.Resume
    exposing
        ( viewResume
        )

import Css exposing (color, em, flexBasis, flexGrow, lineHeight, num, padding2, right, textAlign)
import CssShorthand exposing (displayFlexColumn, displayFlexRow)
import Data.Basic exposing (BasicData)
import Html.Styled exposing (Html, a, div, footer, h1, h2, header, main_, nav, p, section, styled, text)
import Html.Styled.Attributes exposing (href)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Colors exposing (printBlack)
import View.Metrics exposing (standardLineHeight)


viewResume : Model -> Html Msg
viewResume model =
    let
        basicData =
            model.data.basic

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
        [ viewHeader basicData
        , viewMain
        , viewFooter basicData.sourceURL
        ]


viewHeader : BasicData -> Html Msg
viewHeader basicData =
    let
        style =
            [ displayFlexRow
            ]
    in
    styled header
        style
        []
        [ viewPrimary basicData.name
        , viewContact basicData.emailAddress
        ]


viewPrimary : String -> Html Msg
viewPrimary name =
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
        , p [] [ text "Software developer (10 years experience)" ]
        ]


viewContact : String -> Html Msg
viewContact emailAddress =
    let
        style =
            [ displayFlexColumn
            , textAlign right
            ]
    in
    styled nav
        style
        []
        [ a
            [ href <| "mailto:" ++ emailAddress ]
            [ text emailAddress ]
        ]


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


viewFooter : String -> Html Msg
viewFooter sourceURL =
    footer
        []
        [ a
            [ href sourceURL ]
            [ text <| "Made with Elm (" ++ sourceURL ++ ")" ]
        ]
