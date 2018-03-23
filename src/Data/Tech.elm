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
    , shortName : Maybe String
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
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "C"
            Nothing
            "An intro"
            [ markedString "A visual H.264 video debugger GUI at `LSI Logic`"
            ]
            PortfolioOnly
        , TechItemData
            "C++"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "C#"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "CSS3"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "DSLs"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Elm"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "JavaScript (ES6)"
            (Just "ES6")
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Excel"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "functional programming"
            (Just "FP")
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "functional animation"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Google App Engine"
            (Just "GAE")
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Go"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Heroku"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "HTML5"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "internationalization & localization"
            (Just "i18n & l10n")
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "JavaScript"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Lua"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Python"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Qt"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "React"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "responsive design"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Ruby"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Rails"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Sass"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "SQL"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "SVG"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Scala"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Scheme"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "TDD"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Unicode"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Vue.js"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "WinForms"
            Nothing
            "An intro"
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        ]
    , outro =
        Just "Part of your tech stack not listed? Great! I’m confident in my ability to pick new things up quickly."
    }
