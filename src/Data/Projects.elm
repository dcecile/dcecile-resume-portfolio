module Data.Projects
    exposing
        ( ProjectsData
        , ProjectsItemData
        , initProjectsData
        )

import Data.Section exposing (SectionData)
import Data.Visibility exposing (Visibility(PortfolioAndResume, PortfolioOnly))


type alias ProjectsData =
    SectionData
        { items : List ProjectsItemData
        }


type alias ProjectsItemData =
    { name : String
    , shortName : Maybe String
    , period : String
    , tech : String
    , description : String
    , url : String
    , visibility : Visibility
    }


initProjectsData : ProjectsData
initProjectsData =
    { id = "projects"
    , name = "Side projects"
    , iconBackground = .heart
    , intro =
        "I see software as a medium with amazing potential, and curiosity drives me to learn and create more of it:"
    , items =
        [ ProjectsItemData
            "Forks in the Road"
            (Just "Forks")
            "2018"
            "React / Rails"
            "Probabalistic ranking"
            "https://github.com/dcecile/forks-in-the-road"
            PortfolioAndResume
        , ProjectsItemData
            "Tacit"
            Nothing
            "2017–2018"
            "Scala / CSS3"
            "A programming language"
            "https://github.com/tacit-lang/tacit"
            PortfolioOnly
        , ProjectsItemData
            "Off-Grid Orcs"
            Nothing
            "2017"
            "Scala.js / FP"
            "64x64 pixel RTS game"
            "https://github.com/dcecile/off-grid-orcs"
            PortfolioAndResume
        , ProjectsItemData
            "bitfontmake"
            Nothing
            "2017"
            "Python / UFO"
            "Vectorized bitmap fonts"
            "https://github.com/dcecile/bitfontmake"
            PortfolioOnly
        , ProjectsItemData
            "PR Quest"
            Nothing
            "2017"
            "Vue.js / Airtable"
            "SPA static data viewer"
            "https://github.com/dcecile/pr-quest"
            PortfolioOnly
        , ProjectsItemData
            "/tmp/blog"
            Nothing
            "2017"
            "Rails / Bootstrap"
            "First deployed Rails app"
            "https://github.com/dcecile/tmp-blog"
            PortfolioOnly
        , ProjectsItemData
            "Reactic-Tac-Toe"
            (Just "RTT")
            "2017"
            "React / CSS3"
            "Animations & transitions"
            "https://github.com/dcecile/reactic-tac-toe"
            PortfolioOnly
        , ProjectsItemData
            "Yomikata"
            Nothing
            "2007–2009"
            "C++ / Qt"
            "Snappy desktop manga reader"
            "https://github.com/dcecile/yomikata-qt"
            PortfolioOnly
        , ProjectsItemData
            "Ultra Rainbow Bake Sale"
            (Just "URBS")
            "2016"
            "Lua / LÖVE"
            "Deck building + baking game"
            "https://github.com/dcecile/ultra-rainbow-bake-sale"
            PortfolioOnly
        , ProjectsItemData
            "Tiny Worker Bee"
            (Just "TWB")
            "2017"
            "Vue.js / Go"
            "Twitter content library"
            "https://tinyworkerbee.social/"
            PortfolioAndResume
        , ProjectsItemData
            "My portfolio and resume"
            (Just "(This website)")
            "2018"
            "Elm / CSS3"
            "My portfolio and resume"
            "https://github.com/dcecile/dcecile-resume-portfolio"
            PortfolioOnly
        ]
    , outro = Nothing
    }
