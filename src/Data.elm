module Data
    exposing
        ( Data
        , initData
        )

import Data.Basic exposing (BasicData, initBasicData)
import Data.Mindsets exposing (MindsetsData, initMindsetsData)
import Data.Links exposing (LinksData, initLinksData)
import Data.Projects exposing (ProjectsData, initProjectsData)
import Data.Tech exposing (TechData, initTechData)
import Data.Work exposing (WorkData, initWorkData)


type alias Data =
    { basic : BasicData
    , links : LinksData
    , mindsets : MindsetsData
    , tech : TechData
    , projects : ProjectsData
    , work : WorkData
    }


initData : Data
initData =
    { basic = initBasicData
    , links = initLinksData
    , mindsets = initMindsetsData
    , tech = initTechData
    , projects = initProjectsData
    , work = initWorkData
    }
