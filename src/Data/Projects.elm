module Data.Projects exposing
    ( ProjectsData
    , ProjectsItemData
    , initProjectsData
    )

import Data.Basic exposing (homepageURL, sourceURL)
import Data.Section exposing (SectionData)
import Data.Visibility exposing (ResumeVariant(..), Visibility, portfolioAndResume, portfolioOnly)
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
    , homepageURL : Maybe String
    , sourceURL : Maybe String
    , detailsIntro : MarkedString
    , detailsPoints : List MarkedString
    , visibility : Visibility
    }


initProjectsData : ProjectsData
initProjectsData =
    { id = "projects"
    , name = "Side projects"
    , portfolioIconBackground = .heart
    , detailsNoun = "project"
    , portfolioIntro =
        "In my spare time, I’ve been working on a few of my own software ideas. Come take a look!"
    , items =
        [ ProjectsItemData
            "Pentagram"
            Nothing
            "2010–present"
            "Python / FP"
            "RPN programming language"
            Nothing
            (Just "https://github.com/pentagram-lang")
            (markedString "I’m `making` a programming language, inspired by learning Haskell and finding out about concatenative languages. It’s still largely in the design phase, and I’ve gone through multiple evolutions in my approach.")
            [ markedString "The current interpreter is written in `Python`, using stages of `functional programming` transformations to get from input text to runnable code"
            , markedString "My next milestone is to interpret in-language unit `testing`, so I can start writing a prelude that’s tested with `continuous integration & deployment`"
            ]
            (portfolioAndResume [ GoResume ])
        , ProjectsItemData
            "Fertile Earth"
            Nothing
            "2021–present"
            "TypeScript / Rust"
            "Forum web app with FTS"
            Nothing
            (Just "https://github.com/dcecile/fertile-earth")
            (markedString "I’ve started `making` a forum web app, to experiment with new back-end and front-end technologies.")
            [ markedString "It uses custom HTML and `CSS` `domain-specific languages` written in `TypeScript` for the front-end"
            , markedString "The back-end is split into `Node.js` app and Rust full-text search services"
            , markedString "All `TypeScript` code is executed as ES Modules, with hot reloading powered by esbuild"
            , markedString "The data layer uses CockroachDB (distributed, `PostgreSQL`-compatible), `Redis` (caching), and Tantivy (full-text search)"
            , markedString "I’ve set up GitHub Actions `continuous integration & deployment` to release to Fly.io with each commit that passes unit `testing`"
            ]
            (portfolioAndResume [ GeneralResume, ElmResume ])
        , ProjectsItemData
            "Forks in the Road"
            Nothing
            "2018"
            "React / Rails"
            "Value estimation web app"
            (Just "https://forks-in-the-road.herokuapp.com/")
            (Just "https://github.com/dcecile/forks-in-the-road")
            (markedString "In 2018, to improve my web dev skills, I was `making` a web app that helps users make data-informed decisions. It estimates expected values based on user-specified probabilities, and its first task is helping me pick the companies that I want to apply to for my job search.")
            [ markedString "I used Ruby and Rails for the back-end (`PostgreSQL` database), with GitHub-based JWT authentication"
            , markedString "I used `React` and `JavaScript` for the front-end, with an emphasis on `functional programming`"
            , markedString "I used Sass to simplify `CSS` syntax, Bootstrap for base styling, and `functional animation` for every state change"
            , markedString "I set up Semaphore `continuous integration & deployment` to release to Heroku with each commit that passes unit `testing`"
            ]
            (portfolioAndResume [ GeneralResume, ElmResume ])
        , ProjectsItemData
            "Off-Grid Orcs"
            Nothing
            "2017"
            "Scala.js / FP"
            "64x64 pixel web game"
            (Just "https://dcecile.itch.io/off-grid-orcs")
            (Just "https://github.com/dcecile/off-grid-orcs")
            (markedString "In 2017, I joined a 17-day game jam, and created this pixel-art, real-time strategy HTML game using `Scala` and Scala.js:")
            [ markedString "I made a simple software rendering engine that uploads image data directly to the HTML5 Canvas"
            , markedString "I used this rendering engine to create my 64x64 pixel `visual design`"
            , markedString "I implemented a goal-based, pathfinding AI for orcs to gather resources and construct buildings"
            , markedString "I designed a custom font, and converted it to TTF format for outside-game-use via `bitfontmake`"
            , markedString "I used a `functional programming` architecture that transforms immutable data every frame"
            ]
            (portfolioAndResume [ GeneralResume, ElmResume ])
        , ProjectsItemData
            "bitfontmake"
            Nothing
            "2017"
            "Python / UFO"
            "Bitmap font compiler"
            Nothing
            (Just "https://github.com/dcecile/bitfontmake")
            (markedString "After creating a custom pixel-based font for `Off-Grid Orcs`, I decided to use `Python` to export that font to vector-based TTF:")
            [ markedString "I learned how TTF and UFO font formats work"
            , markedString "I designed and implemented a custom image-based font specification format, which I documented in a `technical requirements` Markdown file"
            , markedString "I converted pixels into vector glyph contours—and together with the correct metadata, I created a working TTF font file"
            , markedString "I turned my Python code into a Flask application and deployed it to Heroku"
            ]
            (portfolioAndResume [ GoResume ])
        , ProjectsItemData
            "Yomikata"
            Nothing
            "2007–2009"
            "C++ / Qt"
            "Snappy desktop manga reader"
            Nothing
            (Just "https://github.com/dcecile/yomikata-qt")
            (markedString "From 2007 to 2009 I worked to create a Qt comics and manga reader using C++:")
            [ markedString "I used processes and `threads` to unpack and decode images in the background"
            , markedString "I used unit `testing` to verify my page turning logic (complicated by the presence of spread pages)"
            , markedString "I used a full-screen `functional animation` during image loading to provide user feedback"
            ]
            portfolioOnly
        , ProjectsItemData
            "Ultra Rainbow Bake Sale"
            (Just "URBS")
            "2016"
            "Lua / LÖVE"
            "Deck building + baking game"
            (Just "https://dcecile.itch.io/ultra-rainbow-bake-sale")
            (Just "https://github.com/dcecile/ultra-rainbow-bake-sale")
            (markedString "In 2016, I had an idea for a deck-building baking game, and brought it to life with the `Lua`, the LÖVE game development library, and lots of listening to players:")
            [ markedString "I started with a simple implementation—gradually adding features informed by feedback from friends and forum users"
            , markedString "I learned a new style of programming: prototype-based OOP"
            , markedString "I used `functional animation` to give the game an element of juiciness"
            , markedString "I implemented an AI-like dynamic hints system using a sequence of play conditions and suggestions"
            ]
            portfolioOnly
        , ProjectsItemData
            "My Portfolio and Resume"
            (Just "(This website)")
            "2018–present"
            "Elm / CSS"
            "Interactive skills showcase"
            (Just homepageURL)
            (Just sourceURL)
            (markedString "For my 2018 job search, I decided to create a GitHub homepage to host my portfolio and my resume:")
            [ markedString "I use `CSS` (via an `Elm` DSL) for the `visual design`—screen, print, `responsive design`, and `functional animation`"
            , markedString "I use `Elm`’s `functional programming` architecture to transform immutable data during state changes and display it as HTML"
            , markedString "I use `Elm` to construct custom `SVG` illustrations, which I style and animate via `CSS`"
            , markedString "I use GitHub Actions `continuous integration & deployment` for unit `testing`, style tests, and release to GitHub Pages"
            ]
            (portfolioAndResume [ ElmResume ])
        ]
    , portfolioOutro = Nothing
    }
