module View
    exposing
        ( view
        )

import Html.Styled exposing (Html, div)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Portfolio exposing (viewPortfolio)
import View.ResumeDisplay exposing (viewResumeDisplay)
import View.ResumePrint exposing (viewResumePrint)


view : Model -> Html Msg
view model =
    div
        []
        [ if model.resumeDisplay then
            viewResumeDisplay
          else
            viewPortfolio model
        , viewResumePrint
        ]
