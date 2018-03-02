module Data.Tech
    exposing
        ( TechData
        , TechItemData
        , TechItemVisibility(PortfolioAndResume, PortfolioOnly)
        , initTechData
        )

import Data.Section exposing (SectionData)


type alias TechData =
    SectionData
        { items : List TechItemData
        }


type alias TechItemData =
    { name : String
    , visibility : TechItemVisibility
    }


type TechItemVisibility
    = PortfolioOnly
    | PortfolioAndResume


initTechData : TechData
initTechData =
    { id = "tech"
    , name = "Tech fluency"
    , iconBackground = .box
    , intro =
        "I’m always looking for new opportunities to learn, so my list of productive-use technologies keeps growing:"
    , items =
        [ TechItemData "Bootstrap" PortfolioOnly
        , TechItemData "C" PortfolioOnly
        , TechItemData "C++" PortfolioOnly
        , TechItemData "C#" PortfolioAndResume
        , TechItemData "CSS3" PortfolioAndResume
        , TechItemData "Elm" PortfolioOnly
        , TechItemData "ES6" PortfolioOnly
        , TechItemData "Excel" PortfolioOnly
        , TechItemData "FP" PortfolioAndResume
        , TechItemData "functional animation" PortfolioOnly
        , TechItemData "GAE" PortfolioOnly
        , TechItemData "Go" PortfolioOnly
        , TechItemData "Heroku" PortfolioOnly
        , TechItemData "HTML5" PortfolioOnly
        , TechItemData "Java" PortfolioOnly
        , TechItemData "JavaScript" PortfolioAndResume
        , TechItemData "Lua" PortfolioOnly
        , TechItemData "Python" PortfolioAndResume
        , TechItemData "Qt" PortfolioOnly
        , TechItemData "React" PortfolioAndResume
        , TechItemData "responsive design" PortfolioOnly
        , TechItemData "Ruby" PortfolioAndResume
        , TechItemData "Rails" PortfolioAndResume
        , TechItemData "Sass" PortfolioOnly
        , TechItemData "SQL" PortfolioAndResume
        , TechItemData "SVG" PortfolioAndResume
        , TechItemData "Scala" PortfolioAndResume
        , TechItemData "Scheme" PortfolioOnly
        , TechItemData "Unicode" PortfolioOnly
        , TechItemData "Vue.js" PortfolioAndResume
        , TechItemData "WinForms" PortfolioOnly
        ]
    , outro =
        Just "Part of your tech stack not listed? Great! I’m confident in my ability to pick new things up quickly."
    }
