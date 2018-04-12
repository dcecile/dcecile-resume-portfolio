module View.About
    exposing
        ( viewAbout
        )

import Css exposing (auto, bold, center, em, fontSize, fontStyle, fontWeight, italic, marginBottom, maxWidth, zero)
import CssShorthand exposing (marginRightLeft, marginTopBottom)
import Html.Styled exposing (Html, div, h2, p, styled, text)
import Html.Styled.Attributes exposing (id)
import Model exposing (Model)
import Msg exposing (Msg)


viewAbout : Model -> Html Msg
viewAbout model =
    let
        basicData =
            model.data.basic

        style =
            [ marginRightLeft auto
            , marginBottom <| em 2
            , maxWidth <| em 26
            ]
    in
    styled div
        style
        [ id "about" ]
        [ viewHeader
        , viewContent basicData.about
        ]


viewHeader : Html Msg
viewHeader =
    let
        style =
            [ marginTopBottom zero
            , fontSize <| em 0.85
            , fontWeight bold
            ]
    in
    styled h2
        style
        []
        [ text "About me" ]


viewContent : String -> Html Msg
viewContent about =
    let
        style =
            [ marginTopBottom zero
            , fontSize <| em 0.85
            , fontStyle italic
            ]
    in
    styled p
        style
        [ id "about" ]
        [ text about ]
