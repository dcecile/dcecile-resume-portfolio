module Data.Projects
    exposing
        ( ProjectsData
        , initProjectsData
        )

import Data.Section exposing (SectionData)
import Icon exposing (heartBackground)


type alias ProjectsData =
    SectionData


initProjectsData : ProjectsData
initProjectsData =
    { id = "projects"
    , name = "Side projects"
    , iconBackground = heartBackground
    }
