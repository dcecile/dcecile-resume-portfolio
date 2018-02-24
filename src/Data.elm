module Data
    exposing
        ( Data
        , SectionDataSelector
        , initData
        )

import Data.Mindsets exposing (MindsetsData, initMindsetsData)
import Data.Projects exposing (ProjectsData, initProjectsData)
import Data.Section exposing (SectionData)
import Data.Tech exposing (TechData, initTechData)
import Data.Work exposing (WorkData, initWorkData)


type alias Data =
    { mindsets : MindsetsData
    , tech : TechData
    , projects : ProjectsData
    , work : WorkData
    }


type alias SectionDataSelector =
    Data -> SectionData


initData : Data
initData =
    { mindsets = initMindsetsData
    , tech = initTechData
    , projects = initProjectsData
    , work = initWorkData
    }
