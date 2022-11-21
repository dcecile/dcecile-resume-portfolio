module Data exposing
    ( Data
    , initData
    )

import Data.Basic exposing (BasicData, initBasicData)
import Data.Education exposing (EducationData, initEducationData)
import Data.Links exposing (LinksData, initLinksData)
import Data.Mindsets exposing (MindsetsData, initMindsetsData)
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
    , education : EducationData
    }


initData : Data
initData =
    { basic = initBasicData
    , links = initLinksData
    , mindsets = initMindsetsData
    , tech = initTechData
    , projects = initProjectsData
    , work = initWorkData
    , education = initEducationData
    }
