module View
    exposing
        ( view
        )

import Css exposing (hidden, overflow)
import Html.Styled exposing (Html, div, styled)
import MaybeEx
import Model exposing (Model)
import Msg exposing (Msg)
import View.Details exposing (maybeViewDetails)
import View.Portfolio exposing (viewPortfolio)
import View.ResumeDisplay exposing (viewResumeDisplay)
import View.ResumePrint exposing (viewResumePrint)


view : Model -> Html Msg
view model =
    let
        style =
            [ overflow hidden
            ]
    in
    (styled div style [] << List.concat)
        [ if model.resumeDisplay then
            List.singleton <|
                viewResumeDisplay model
          else
            List.concat
                [ viewPortfolio model |> List.singleton
                , maybeViewDetails model |> MaybeEx.toList
                ]
        , viewResumePrint model |> List.singleton
        ]
