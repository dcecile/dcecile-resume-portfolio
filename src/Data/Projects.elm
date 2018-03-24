module Data.Projects
    exposing
        ( ProjectsData
        , ProjectsItemData
        , initProjectsData
        )

import Data.Section exposing (SectionData)
import Data.Visibility exposing (Visibility(PortfolioAndResume, PortfolioOnly))
import MarkedString exposing (MarkedString, markedString)


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
    , homepageUrl : Maybe String
    , sourceUrl : Maybe String
    , detailsIntro : MarkedString
    , detailsPoints : List MarkedString
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
            (Just "https://forks-in-the-road.herokuapp.com/")
            (Just "https://github.com/dcecile/forks-in-the-road")
            (markedString "This is the result of my job search outgrowing its spreadsheet:")
            [ markedString "`Ruby` and `Rails` for the back-end, using GitHub-based JWT authentication"
            , markedString "`React` and ES6 `JavaScript` an emphasis on `functional programming` for the front-end"
            , markedString "`Sass` to simplify `CSS3` syntax, and `Bootstrap` for basic UI elements"
            , markedString "All continuously deployed to `Heroku` with each commit"
            ]
            PortfolioAndResume
        , ProjectsItemData
            "Tacit"
            Nothing
            "2017–2018"
            "Scala / CSS3"
            "A programming language"
            Nothing
            (Just "https://github.com/tacit-lang/tacit")
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , ProjectsItemData
            "Off-Grid Orcs"
            Nothing
            "2017"
            "Scala.js / FP"
            "64x64 pixel RTS game"
            Nothing
            (Just "https://github.com/dcecile/off-grid-orcs")
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , ProjectsItemData
            "bitfontmake"
            Nothing
            "2017"
            "Python / UFO"
            "Vectorized bitmap fonts"
            Nothing
            (Just "https://github.com/dcecile/bitfontmake")
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , ProjectsItemData
            "PR Quest"
            Nothing
            "2017"
            "Vue.js / Airtable"
            "SPA static data viewer"
            Nothing
            (Just "https://github.com/dcecile/pr-quest")
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , ProjectsItemData
            "/tmp/blog"
            Nothing
            "2017"
            "Rails / Bootstrap"
            "First deployed Rails app"
            Nothing
            (Just "https://github.com/dcecile/tmp-blog")
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , ProjectsItemData
            "Reactic-Tac-Toe"
            (Just "RTT")
            "2017"
            "React / CSS3"
            "Animations & transitions"
            Nothing
            (Just "https://github.com/dcecile/reactic-tac-toe")
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , ProjectsItemData
            "Yomikata"
            Nothing
            "2007–2009"
            "C++ / Qt"
            "Snappy desktop manga reader"
            Nothing
            (Just "https://github.com/dcecile/yomikata-qt")
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , ProjectsItemData
            "Ultra Rainbow Bake Sale"
            (Just "URBS")
            "2016"
            "Lua / LÖVE"
            "Deck building + baking game"
            Nothing
            (Just "https://github.com/dcecile/ultra-rainbow-bake-sale")
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , ProjectsItemData
            "Tiny Worker Bee"
            (Just "TWB")
            "2017"
            "Vue.js / Go"
            "Twitter content library"
            (Just "https://tinyworkerbee.social/")
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , ProjectsItemData
            "My Portfolio and Resume"
            (Just "(This website)")
            "2018"
            "Elm / CSS3"
            "My portfolio and resume"
            Nothing
            (Just "https://github.com/dcecile/dcecile-resume-portfolio")
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        ]
    , outro = Nothing
    }
