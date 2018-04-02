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
        "I’m serious about learning new skills. For me, extra time spent on reading and practice always pays off."
    , items =
        [ TechItemData
            "Bootstrap"
            Nothing
            (markedString "This component library is a new addition to my `visual design` toolbox, and I’ve used it for two projects fo far:")
            [ markedString "With `/tmp/blog`, I used Bootstrap’s “cards” for attention-grabbing calls to action"
            , markedString "In `Forks in the Road`, I’m taking advantage of Bootstrap’s excellent form input controls"
            ]
            PortfolioOnly
        , TechItemData
            "bug reporting"
            Nothing
            (markedString "Writing clear and helpful bug reports is a key skill for any member of a software development team, and it’s one that I’ve been practising since my second co-op job:")
            [ markedString "At `Coreworx`, during my time helping QA with testing, I learned the keys to effective bug reporting"
            , markedString "At `Unitron`, I continued to work at `improving` my bug reporting as I logged bugs for my team and for other teams"
            , markedString "At `Unitron`, I also regularly triaged my team’s bugs, and spent time `teaching` others what to fix for unclear bug reports"
            ]
            PortfolioOnly
        , TechItemData
            "C"
            Nothing
            (markedString "I learned `C++` first, so I tend to see C as a restricted (some would say safer) environment for systems programming:")
            [ markedString "At university, I used C to add virtual memory features to an operating system"
            , markedString "At `LSI Logic`, I used C to add features to a visual H.264 video debugger"
            , markedString "At `LSI Logic`, I used C to fix H.264 video decoder bugs"
            , markedString "(Recently I’ve been using the related `C#` and `Go` languages more than C)"
            ]
            PortfolioOnly
        , TechItemData
            "C++"
            Nothing
            (markedString "C++ in high school was when I learned how pointers work, and was also my first exposure to generic programming:")
            [ markedString "In high school, I worked on a team project to build a 3D RPG game in C++"
            , markedString "I used C++ and `Qt` to build my `Yomikata` comic book and manga reader"
            , markedString "(Recently I’ve been using the related `Go`, `C#`, and `Scala` languages more than C++)"
            ]
            PortfolioOnly
        , TechItemData
            "C#"
            Nothing
            (markedString "By now, I’ve read and written more code in .NET’s C# than any other programming language. I have a solid grasp of advanced features like LINQ, reflection, code generation, and async/await. I know how to write good, maintainable C#.")
            [ markedString "At `Coreworx`, I first used C# to add features to an ASP.NET document management system"
            , markedString "At `Unitron`, I used C# for 8 years as I implemented and maintained manufacturing subsystems"
            , markedString "At `Unitron`, I used C# together with `SQL` to create internal tools focused on `improving` development and QA processes"
            ]
            PortfolioAndResume
        , TechItemData
            "continuous integration"
            (Just "CI")
            (markedString "I have a strong interest in build systems and continuous integration:")
            [ markedString "Starting at `LSI Logic`, and continuing at `NexJ Systems` and `Unitron`, I’ve been making build systems improvements for maintainability and productivity"
            , markedString "At `Unitron`, I translated my build system experience into improvements and maintenance for our TeamCity continuous integration server"
            , markedString "After experiencing the benefit of continually-deployed internal tools at `Unitron`, I’ve set up `Forks in the Road` and `My Portfolio and Resume` for continuous deployment using Semaphore"
            ]
            PortfolioOnly
        , TechItemData
            "code review"
            Nothing
            (markedString "With my team at `Unitron`, every change required the approval of two reviewers before being committed to `version control`:")
            [ markedString "This offered excellent opportunities for `learning` and `teaching` about code maintainability as well as specific features, components, and technologies"
            , markedString "Diligently applying this practice was a key step in `improving` the quality of our software"
            , markedString "We found that the time spent on reviews was a net positive for our team’s productivity"
            , markedString "(We mainly used SmartBear’s Collaborator, and sometimes used GitHub)"
            ]
            PortfolioOnly
        , TechItemData
            "CSS"
            Nothing
            (markedString "These days, my primary tool for `visual design` is CSS:")
            [ markedString "At `Unitron`, I used CSS to implement a hybrid `HTML` desktop app according to initial mockups"
            , markedString "In `PR Quest` and `Forks in the Road`, I’ve leveraged my `Qt` experience to set up CSS flexbox layouts"
            , markedString "In `/tmp/blog` and `PR Quest`, I use CSS3 media queries for `responsive design`"
            , markedString "With `Reactic-Tac-Toe` and `Forks in the Road`, I’m `learning` CSS3 transitions and animations for `functional animation`"
            , markedString "With `My Portfolio and Resume`, I’m using CSS for my entire resume layout & styling"
            ]
            PortfolioAndResume
        , TechItemData
            "domain-specific languages"
            (Just "DSLs")
            (markedString "I have experience both using and creating DSLs:")
            [ markedString "At `NexJ Systems`, I used an in-house `Scheme` DSL with all of my work on the CRM user interface and business logic"
            , markedString "At `Unitron`, I created a `C#` DSL for specifying related test plans, to improve maintainability and track history in `version control`"
            , markedString "With `My Portfolio and Resume` and `Tacit`, I’m using `Elm` and `Scala` DSLs for writing `HTML` and `CSS` code"
            ]
            PortfolioOnly
        , TechItemData
            "Elm"
            Nothing
            (markedString "Elm is a front-end `functional programming` language that I started learning while `making` `My Portfolio and Resume`.")
            []
            PortfolioOnly
        , TechItemData
            "Excel"
            Nothing
            (markedString "At `Unitron`, I used Excel together with `SQL` for `analyzing` data:")
            [ markedString "I used Excel pivot tables and pivot charts to explore trends and correlations"
            , markedString "I copied Excel summary tables and charts into emails to help explain the data to managers"
            , markedString "I linked Excel to `SQL` tables and views, to create live reports"
            ]
            PortfolioOnly
        , TechItemData
            "functional programming"
            (Just "FP")
            (markedString "I use this programming style because it helps me cleanly extract sub-problems:")
            [ markedString "At `Unitron`, functional programming made `test-driven development` easier to apply for a numeric comparison `C#` GUI app"
            , markedString "In `My Portfolio and Resume`, functional programming helps keep my `Elm` code well-organized, and makes refactoring a breeze"
            , markedString "In `Off-Grid Orcs`, functional programming helped prevent newly-implemented `Scala` features from breaking existing functionality"
            ]
            PortfolioAndResume
        , TechItemData
            "functional animation"
            Nothing
            (markedString "Functional animation helps me remove surprise from my UIs during state changes:")
            [ markedString "In `Ultra Rainbow Bake Sale`, I used functional animation in `Lua` to give the game a more lively feel"
            , markedString "With `Reactic-Tac-Toe`, I learned how to use `CSS` animations and transitions"
            , markedString "In `Forks in the Road`, I use functional animation for all `React` page changes and form actions"
            ]
            PortfolioOnly
        , TechItemData
            "Google App Engine"
            (Just "GAE")
            (markedString "My `Go` back-end for `Tiny Worker Bee` is built on Google App Engine, making use of the Datastore, Task Queue, and URL Fetch features.")
            []
            PortfolioOnly
        , TechItemData
            "Go"
            Nothing
            (markedString "I’m using Go with `Google App Engine` for the back-end for `Tiny Worker Bee`. It’s not a lot of code, but I’m making use of Go data structures, higher-order functions, and error handling.")
            []
            PortfolioOnly
        , TechItemData
            "Heroku"
            Nothing
            (markedString "I’ve deployed both of my `Rails` apps, `/tmp/blog/` and `Forks in the Road`, to Heroku (using Postgres as my `SQL` database).")
            []
            PortfolioOnly
        , TechItemData
            "HTML"
            Nothing
            (markedString "I enjoy `making` web applications using HTML, `CSS`, and `JavaScript` because I know they’ll run on any modern browser:")
            [ markedString "At `Unitron`, as an experiment with a new GUI technology beyond `WinForms` and WPF, I created a hybrid HTML and `C#` desktop application (not using Chrome + Electron, but using a custom IE + .NET WebBrowser control integration)"
            , markedString "With `Off-Grid Orcs`, I learned how to do direct HTML5 Canvas buffer uploads to create a 64x64-pixel `Scala` game"
            , markedString "With `PR Quest`, I used `Vue.js` (with an HTML5 History API router) to create a single-page application that can be navigated without page loads"
            , markedString "Other web apps I’ve made: `Forks in the Road`, `My Portfolio and Resume`, `Reactic-Tac-Toe`, `Tacit`, `Tiny Worker Bee`, `/tmp/blog`"
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
            "Java"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            , markedString "(Recently I’ve been using the related `C#` and `Scala` languages more than Java)"
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
            "Linux"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
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
            (markedString "My first `Linux` distro was Kubuntu, and from using KDE I got curious about `making` my own desktop applications in Qt:")
            [ markedString "From 2007 to 2009, I used Qt Widget to create my `Yomikata` comic book and manga reader"
            , markedString "In 2016, I learned enough Qt Quick to start creating a management simulation game"
            , markedString "(Recently I’ve been more focused on `HTML` instead of Qt)"
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
            (markedString "At `Unitron`, I used `SQL` for `analyzing` data and creating internal development/QA tools:")
            [ markedString "I used Excel together with ad hoc SQL queries to investigate bugs and communicate my findings"
            , markedString "I optimized my ad hoc SQL queries to run on large datasets that were originally impossible"
            , markedString "I created an SQL data warehouse with materialized views, for analyzing trends that spanned multiple upstream DBs"
            , markedString "I used `C#` and SQL via `continuous integration` for populating and monitoring the data warehouse"
            , markedString "I used the SQL materialized views in internal development and QA tools, with `C#` and `WinForms`"
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
            "test-driven development"
            (Just "TDD")
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
            "version control"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "visual design"
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
            (markedString "My team at `Unitron` worked primarily in `C#` creating WinForms desktop software, and using this technology,")
            [ markedString "I created a user management module using DevExpress layouts and data-binding"
            , markedString "I built a test run comparison application, `improving` a process that previously included manual spreadsheet authoring"
            , markedString "I made an `SQL`-backed test run search and summary application, to help QA focus testing resources using production data"
            , markedString "I set up a semi-automated `internationalization & localization` workflow"
            ]
            PortfolioOnly
        ]
    , outro = Nothing
    }
