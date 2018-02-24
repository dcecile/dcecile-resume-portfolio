module View.Mindsets
    exposing
        ( viewMindsets
        )

import Html.Styled exposing (Html)
import Model exposing (Model)
import Msg exposing (Msg)
import View.Section exposing (viewSection, viewSectionParagraph)


viewMindsets : Model -> Html Msg
viewMindsets model =
    let
        sectionData =
            model.data.mindsets
    in
    viewSection model
        sectionData
        [ viewSectionParagraph sectionData.intro
        ]
