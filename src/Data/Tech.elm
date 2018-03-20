module Data.Tech
    exposing
        ( TechData
        , TechItemData
        , initTechData
        )

import Data.Section exposing (SectionData)
import Data.Visibility exposing (Visibility(PortfolioAndResume, PortfolioOnly))
import MarkedString exposing (MarkedString, markedString)


type alias TechData =
    SectionData
        { items : List TechItemData
        }


type alias TechItemData =
    { name : String
    , detailsIntro : String
    , detailsPoints : List MarkedString
    , visibility : Visibility
    }


initTechData : TechData
initTechData =
    { id = "tech"
    , name = "Tech fluency"
    , iconBackground = .box
    , intro =
        "I’m always looking for new opportunities to learn, so my list of productive-use technologies keeps growing:"
    , items =
        [ TechItemData
            "Bootstrap"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "C"
            "An intro"
            [ markedString "A visual H.264 video debugger GUI at `LSI Logic`"
            ]
            PortfolioOnly
        , TechItemData
            "C++"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "C#"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "CSS3"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "DSLs"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Elm"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "ES6"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Excel"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "FP"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "functional animation"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "GAE"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Go"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Heroku"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "HTML5"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "i18n & l10n"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "JavaScript"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Lua"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Python"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Qt"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "React"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "responsive design"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Ruby"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Rails"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Sass"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "SQL"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "SVG"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Scala"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Scheme"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "TDD"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Unicode"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Vue.js"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "WinForms"
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        ]
    , outro =
        Just "Part of your tech stack not listed? Great! I’m confident in my ability to pick new things up quickly."
    }
