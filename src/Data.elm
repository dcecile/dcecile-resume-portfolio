module Data
    exposing
        ( Data
        , initData
        )

import Data.Mindsets exposing (MindsetsData, initMindsetsData)
import Data.Projects exposing (ProjectsData, initProjectsData)
import Data.Tech exposing (TechData, initTechData)
import Data.Work exposing (WorkData, initWorkData)


type alias Data =
    { mindsets : MindsetsData
    , tech : TechData
    , projects : ProjectsData
    , work : WorkData
    }


initData : Data
initData =
    { mindsets = initMindsetsData
    , tech = initTechData
    , projects = initProjectsData
    , work = initWorkData
    }
