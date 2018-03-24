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
    , detailsIntro : MarkedString
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
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "C"
            Nothing
            (markedString "An intro")
            [ markedString "A visual H.264 video debugger GUI at `LSI Logic`"
            ]
            PortfolioOnly
        , TechItemData
            "C++"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "C#"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "CSS3"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "DSLs"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Elm"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Excel"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "functional programming"
            (Just "FP")
            (markedString "After intially `learning` Haskell, this programming style has captured my imagination with the way it helps cleanly extracting sub-problems.")
            [ markedString "At `Unitron`, functional programming made `TDD` easier to apply for a numeric comparison `C#` GUI app"
            , markedString "In `My Portfolio and Resume`, functional programming helps keep my `Elm` code well-organized, and makes refactoring a breeze"
            ]
            PortfolioAndResume
        , TechItemData
            "functional animation"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Google App Engine"
            (Just "GAE")
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Go"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Heroku"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "HTML5"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "internationalization & localization"
            (Just "i18n & l10n")
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "JavaScript"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Lua"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Python"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Qt"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "React"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "responsive design"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Ruby"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Rails"
            Nothing
            (markedString "I’m `learning` this `Ruby` framework for insight into the tech behind some of my favourite web apps.")
            [ markedString "With `/tmp/blog`, I built my very first Rails app and deployed it to `Heroku`"
            , markedString "In `Forks in the Road`, I’m using Rails together with `React` to create an alternatives-ranking SPA web app"
            ]
            PortfolioAndResume
        , TechItemData
            "Sass"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "SQL"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "SVG"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Scala"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "Scheme"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "TDD"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Unicode"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "Vue.js"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "WinForms"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        ]
    , outro =
        Just "Part of your tech stack not listed? Great! I’m confident in my ability to pick new things up quickly."
    }
