module Data.Projects
    exposing
        ( ProjectsData
        , ProjectsItemData
        , initProjectsData
        )

import Data.Basic exposing (homepageURL, sourceURL)
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
            "Forks in the Road"
            (Just "Forks")
            "2018"
            "React / Rails"
            "Value estimation tool"
            (Just "https://forks-in-the-road.herokuapp.com/")
            (Just "https://github.com/dcecile/forks-in-the-road")
            (markedString "I’m `making` a web app that helps users make data-informed decisions. It estimates expected values based on user-specified probabilities, and its first task is helping me pick the companies that I want to apply to for my job search.")
            [ markedString "I’m using `Ruby` and `Rails` for the back-end, with GitHub-based JWT authentication"
            , markedString "I’m using `React` and `JavaScript` for the front-end, with an emphasis on `functional programming`"
            , markedString "I’m using `Sass` to simplify `CSS` syntax, `Bootstrap` for base styling, and `functional animation` for every state change"
            , markedString "I’ve set up Semaphore `continuous integration` to deploy to `Heroku` with each commit that passes unit testing"
            ]
            PortfolioAndResume
        , ProjectsItemData
            "Tacit"
            Nothing
            "2017–2018"
            "Scala / CSS"
            "A programming language"
            Nothing
            (Just "https://github.com/tacit-lang/tacit")
            (markedString "I’m `making` a programming language.")
            [ markedString "(Current progress: evaluating postfix integer expressions and providing helpful error message)"
            , markedString "I’m using `Scala` to implement the program as stages of `functional programming` transformations"
            , markedString "I’ve implemented a console read-eval-print loop (REPL) using the JLine `Java` library"
            , markedString "I’m working to create a web REPL using Scala.js and `CSS`"
            ]
            PortfolioOnly
        , ProjectsItemData
            "Off-Grid Orcs"
            Nothing
            "2017"
            "Scala.js / FP"
            "64x64 pixel web game"
            (Just "https://dcecile.itch.io/off-grid-orcs")
            (Just "https://github.com/dcecile/off-grid-orcs")
            (markedString "In 2017, I joined a 17-day game jam, and created this `HTML` game using `Scala` and Scala.js:")
            [ markedString "I made a simple software rendering engine that uploads image data directly to the HTML5 Canvas"
            , markedString "I used this rendering engine to create my 64x64 pixel `visual design`"
            , markedString "I implemented a goal-based, pathfinding AI for orcs to gather resources and construct buildings"
            , markedString "I designed a custom font, and converted it to TTF format for outside-game-use via `bitfontmake`"
            , markedString "I used a `functional programming` architecture that transforms immutable data every frame"
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
            (markedString "After creating a custom pixel-based font for `Off-Grid Orcs`, I decided to use `Python` to export that font to TTF:")
            [ markedString "I learned how TTF and UFO font formats work"
            , markedString "I designed and implemented a custom image-based font specification format, which I documented in a `technical requirements` Markdown file"
            , markedString "I converted pixels into vector glyph contours—and together with the correct metadata, I created a working TTF font file"
            , markedString "I turned my Python code into a Flask application and deployed it to `Heroku`"
            ]
            PortfolioOnly
        , ProjectsItemData
            "PR Quest"
            Nothing
            "2017"
            "Vue.js / Airtable"
            "SPA static data viewer"
            (Just "https://pr-quest.netlify.com/")
            (Just "https://github.com/dcecile/pr-quest")
            (markedString "As the Canadian debate over proportional representation (PR) was heating up in 2017, I created this website for tracking MP support for electoral change:")
            [ markedString "I learned `Vue.js` and used it to create my first single-page application"
            , markedString "I used Airtable as my data source, exporting the data to JSON during `continuous integration` (deployment to Netlify)"
            , markedString "I also used `HTML` pre-rendering, to help improve page load times and allow basic site use without `JavaScript`"
            ]
            PortfolioOnly
        , ProjectsItemData
            "/tmp/blog"
            Nothing
            "2017"
            "Rails / Bootstrap"
            "First deployed Rails app"
            (Just "https://tmpblog.herokuapp.com/")
            (Just "https://github.com/dcecile/tmp-blog")
            (markedString "I followed a `Rails` tutorial to build this blogging site, and added my own extensions:")
            [ markedString "I used `Bootstrap` together with GitHub’s Octicons to implement a `visual design` that includes clear calls to action"
            , markedString "I added features for parsing body paragraphs and tags"
            , markedString "I deployed the application to `Heroku`, and set up a scheduled task to delete any posts older than 24 hours"
            ]
            PortfolioOnly
        , ProjectsItemData
            "Reactic-Tac-Toe"
            (Just "RTT")
            "2017"
            "React / CSS3"
            "CSS3 animation experiment"
            (Just "https://dcecile-reactic-tac-toe.now.sh/")
            (Just "https://github.com/dcecile/reactic-tac-toe")
            (markedString "I created this simple 2-player game by following a `React` tutorial, and took the opportunity to experiment with `visual design`:")
            [ markedString "I applied `functional animation` to all player actions, making use of both `CSS` transitions and animations"
            , markedString "I used `CSS` filters to apply a uniform chalk texture to all text and lines"
            , markedString "I created a seamless chalk dust texture in Inkscape, and used it for the background"
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
            (markedString "From 2007 to 2009 I worked to create a `Qt` comics and manga reader using `C++`:")
            [ markedString "I used processes and `threads` to unpack and decode images in the background"
            , markedString "I used unit tests to verify my page turning logic (complicated by the presence of spread pages)"
            , markedString "I used a full-screen `functional animation` during image loading to provide user feedback"
            ]
            PortfolioOnly
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
            PortfolioOnly
        , ProjectsItemData
            "Tiny Worker Bee"
            (Just "TWB")
            "2017"
            "Vue.js / Go"
            "Twitter scheduling bot"
            (Just "https://tinyworkerbee.social/")
            Nothing
            (markedString "In 2017, I got curious about marketing and social media. One result is this Twitter bot:")
            [ markedString "I programmed the `Google App Engine` back-end using `Go` to post Tweets from your content library—according to a schedule that optimizes variety over repetition"
            , markedString "I created an `HTML` front-end using `Vue.js` for the user to populate the content library"
            , markedString "I also created a static homepage using `HTML`, `CSS`, and `responsive design`"
            , markedString "(If you’d like to try using this web app or you’d like a peek at the source code, just send me an email to let me know)"
            ]
            PortfolioAndResume
        , ProjectsItemData
            "My Portfolio and Resume"
            (Just "(This website)")
            "2018"
            "Elm / CSS"
            "My portfolio and resume"
            (Just homepageURL)
            (Just sourceURL)
            (markedString "For my 2018 job search, I decided to create a GitHub homepage to host my portfolio and my resume:")
            [ markedString "I use `CSS` (via an `Elm` DSL) to create a unified `visual design` for both screen and print"
            , markedString "I use `Elm`’s `functional programming` architecture to transform immutable data during state changes and display it as `HTML`"
            , markedString "I use `Elm` to construct custom `SVG` illustrations, which I style and animate via `CSS`"
            , markedString "I use Semaphore `continuous integration` for unit tests, style tests, and continuous deployment to GitHub Pages"
            ]
            PortfolioOnly
        ]
    , portfolioOutro = Nothing
    }
