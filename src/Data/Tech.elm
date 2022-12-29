module Data.Tech exposing
    ( TechData
    , TechItemData
    , initTechData
    )

import Data.Section exposing (SectionData)
import Data.Visibility exposing (ResumeVariant(..), Visibility, portfolioAndResume, portfolioOnly)
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
    , name = "Tech skills"
    , portfolioIconBackground = .box
    , detailsNoun = "skill"
    , portfolioIntro =
        "I’m serious about learning new skills and improving my old ones. New skills bring new perspectives and open new doors. Through practice, old skills reveal the keys to mastery."
    , items =
        [ TechItemData
            "AWS"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "bug reporting"
            Nothing
            (markedString "Writing clear and informative bug reports is a key skill for any member of a software development team. It’s one that I’ve been practising since my second internship:")
            [ markedString "At `Coreworx`, during my time helping QA with testing, I learned the keys to effective bug reporting"
            , markedString "At `Sonova`, I continued to work at `improving` my bug reporting as I logged bugs for software components maintained by other teams"
            , markedString "At `Sonova`, I regularly triaged my team’s bugs, and spent time `teaching` others what to fix for unclear bug reports"
            ]
            portfolioOnly
        , TechItemData
            "C#"
            Nothing
            (markedString "By now, I’ve read and written more code in .NET’s C# than in any other programming language. I have a solid grasp of advanced features like LINQ, reflection, code generation, and generics. I know how to write good, maintainable C#.")
            [ markedString "At `Coreworx`, I first used C# to add features to an ASP.NET document management system"
            , markedString "At `Sonova`, I used C# for 8 years as I implemented and maintained manufacturing subsystems"
            , markedString "At `Sonova`, I used C# together with `SQL` to create internal tools focused on `improving` development and QA processes"
            , markedString "At `Sonova`, I used C# `threads` and async/await to build WinForms apps that don’t freeze during extended network and CPU tasks"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "continuous integration and deployment"
            (Just "CI/CD")
            (markedString "I have a strong interest in build systems and continuous integration:")
            [ markedString "Starting at `LSI Logic`, and continuing at `NexJ Systems` and `Sonova`, I’ve made build systems improvements for maintainability and productivity"
            , markedString "At `Sonova`, I translated my build system experience into improvements and maintenance for our TeamCity continuous integration server"
            , markedString "At `Sonova` I experienced the benefit of continuously-deployed ClickOnce internal tools—now I’m using Semaphore to continuously deploy `Forks in the Road` and `My Portfolio and Resume`"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "code review"
            Nothing
            (markedString "With my team at `Sonova`, every change required the approval of two reviewers before being committed to `version control`:")
            [ markedString "This offered excellent opportunities for `learning` and `teaching` about code maintainability as well as specific software features, components, and technologies"
            , markedString "Diligently using code reviews was a key step in `improving` the quality of our software"
            , markedString "We found that the time spent on reviews was a net positive for our team’s productivity"
            , markedString "(We mainly used SmartBear’s Collaborator, and sometimes used GitHub)"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "CSS"
            Nothing
            (markedString "These days, my primary tool for `visual design` is CSS, for making HTML web applications:")
            [ markedString "At `Sonova`, I used CSS to implement a hybrid HTML desktop app according to initial mockups"
            , markedString "In `Forks in the Road`, I’ve leveraged my Qt experience to set up CSS flexbox layouts"
            , markedString "In `My Portfolio and Resume`, I use CSS3 media queries for `responsive design`"
            , markedString "With `Forks in the Road`, I began `learning` how to do `functional animation` with CSS3 transitions and animations"
            , markedString "I’m a fan of Block Element Modifier for organization"
            , markedString "(I’ve also been using CSS via Sass, and via `domain-specific languages` in `Elm` and `Scala`)"
            ]
            (portfolioAndResume [ GeneralResume, ElmResume ])
        , TechItemData
            "data analysis"
            Nothing
            (markedString "At `Sonova`, I used Excel together with `SQL` for `analyzing` data:")
            [ markedString "I used pivot tables and pivot charts to explore trends and correlations"
            , markedString "I copied table and chart summaries into emails—to help communicate the data to managers"
            , markedString "I linked data directly to `SQL` tables and views, to create live reports"
            , markedString "I imported data into Microsoft’s Power BI for more advanced drill-down reporting"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "debugging"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "Django"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "Docker"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "domain-specific languages"
            (Just "DSLs")
            (markedString "I have experience both using and creating DSLs:")
            [ markedString "At `NexJ Systems`, I used an in-house Scheme DSL with my work on the CRM user interface and business logic"
            , markedString "At `Sonova`, I created a `C#` DSL for specifying related test plans—to improve maintainability and to track history in `version control`"
            , markedString "With `My Portfolio and Resume` and `Fertile Earth`, I’m using `Elm` and `TypeScript` DSLs for writing HTML and `CSS` code"
            ]
            portfolioOnly
        , TechItemData
            "Elm"
            Nothing
            (markedString "Elm is a front-end framework and `functional programming` language that I’m `learning` as I make `My Portfolio and Resume`.")
            []
            (portfolioAndResume [ ElmResume ])
        , TechItemData
            "event streams"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "Flutter"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "functional programming"
            (Just "FP")
            (markedString "I use this programming style because it helps me cleanly extract sub-problems:")
            [ markedString "At `NexJ Systems`, I had my first, basic introduction to functional programming as I used Scheme to fix bugs and write unit tests"
            , markedString "At `Sonova`, functional programming made `test-driven development` easier to apply for a test run comparison `C#` GUI app"
            , markedString "In `My Portfolio and Resume`, functional programming helps keep my `Elm` code well-organized, and makes refactoring a breeze"
            , markedString "In `Off-Grid Orcs`, functional programming helped prevent newly-implemented `Scala` features from breaking existing functionality"
            ]
            (portfolioAndResume [ GeneralResume, ElmResume, GoResume ])
        , TechItemData
            "functional animation"
            Nothing
            (markedString "Functional animation helps me remove surprise from my UIs during state changes:")
            [ markedString "In `Ultra Rainbow Bake Sale`, I used functional animation in `Lua` to give the game a more lively feel"
            , markedString "In `Forks in the Road`, I use functional animation for all `React` page changes and form actions"
            ]
            portfolioOnly
        , TechItemData
            "Gatling"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "Git"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "GraphQL"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "Google Cloud Platform"
            (Just "GCP")
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "integration"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "internationalization & localization"
            (Just "i18n & l10n")
            (markedString "On my team at `Sonova`, I was in charge of our translation processes:")
            [ markedString "I converted our primary WinForms software from hard-coded English to supporting Chinese and German, including on-the-fly language changes"
            , markedString "I added basic right-to-left language support to our secondary-market WinForms software"
            , markedString "I managed the localization of our software plus another team's software, `coordinating` translator activities for up to 14 languages"
            , markedString "I worked at continuously `improving` our translation workflow with process changes and `C#` tooling"
            ]
            portfolioOnly
        , TechItemData
            "JavaScript"
            Nothing
            (markedString "I use JavaScript and `TypeScript` for most of my front-end development (with language features like modules, await, and classes provided by Babel):")
            [ markedString "At `Sonova`, I used JavaScript for the UI logic of a hybrid HTML and `C#` desktop app"
            , markedString "In `Forks in the Road`, I’m using JavaScript with `React` for the front-end of my value estimation web app"
            , markedString "(I sometimes use `Elm` or `Scala` instead of JavaScript)"
            ]
            portfolioOnly
        , TechItemData
            "Kubernetes"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "Linux"
            Nothing
            (markedString "I’m comfortable working in Linux, having used it for my primary development environment since university:")
            [ markedString "I know my way around the command line (e.g. for `version control`, shell scripts, and personal system adminitration)"
            , markedString "I troubleshoot my Linux system problems using system logs, application logs, man pages, GDB, Google searches, and bug searches"
            , markedString "I’ve built a couple cross-platform desktop applications: `Ultra Rainbow Bake Sale` and `Yomikata`"
            , markedString "(I also have lots of experience using and troubleshooting Windows)"
            ]
            (portfolioAndResume [ GoResume ])
        , TechItemData
            "log tracing"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "Lua"
            Nothing
            (markedString "I finally learned Lua and used it with LÖVE (a 2D game development library) to build a single-player, deck-building, baking game: `Ultra Rainbow Bake Sale`.")
            []
            portfolioOnly
        , TechItemData
            "monitoring"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "nginx"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "Node.js"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "pair programming"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "PostgreSQL"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "profiling"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "Python"
            Nothing
            (markedString "With `bitfontmake`, I’ve used Python to compile my TTF fonts from a custom pixel-based input format. I deployed this code to Heroku as a Flask application.")
            []
            (portfolioAndResume [ GeneralResume, GoResume ])
        , TechItemData
            "React"
            Nothing
            (markedString "I’m `learning` React to get experience with today’s most popular front-end framework (according to The State of JavaScript 2017):")
            [ markedString "With `Forks in the Road`, I’m using React to create the front-end of my value estimation web app"
            , markedString "(I’ve also used Vue.js and `Elm` for creating HTML front-ends)"
            ]
            (portfolioAndResume [ GeneralResume, ElmResume, GoResume ])
        , TechItemData
            "Redis"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "responsive design"
            Nothing
            (markedString "The promise of HTML web apps is that they’ll run in any modern browser. I use responsive design to make sure that mobile devices are included too:")
            [ markedString "I implement responsive design by using `CSS` media queries to progressively enabling more advanced styling for larger screens"
            , markedString "I’ve set up responsive design for `My Portfolio and Resume`"
            ]
            (portfolioAndResume [ ElmResume ])
        , TechItemData
            "REST"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "Scala"
            Nothing
            (markedString "I’ve enjoyed using Scala as a `functional programming` language:")
            [ markedString "For a previous generation of my `Pentagram` programming language, I took advantage of support for `functional programming` from  of Scala’s type system and standard library"
            , markedString "I used Scala.js to create `Off-Grid Orcs` as an HTML game with a `functional programming` architecture"
            ]
            portfolioOnly
        , TechItemData
            "scale"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "security"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "SQL"
            Nothing
            (markedString "At `Sonova`, I used `SQL` for `analyzing` data and creating internal development/QA tools:")
            [ markedString "I used Excel together with ad hoc SQL queries to investigate bugs and communicate my findings"
            , markedString "I optimized my ad hoc SQL queries to run on large datasets that were initially impossible"
            , markedString "I created an SQL data warehouse with materialized views, for analyzing trends that spanned multiple upstream DBs"
            , markedString "I used `C#` and SQL via `continuous integration and deployment` for populating and monitoring the data warehouse"
            , markedString "I used the SQL materialized views in internal development and QA tools, with `C#` and WinForms"
            ]
            portfolioOnly
        , TechItemData
            "SVG"
            Nothing
            (markedString "I use SVG in my HTML applications, and I know its capabilities (and limitations).")
            [ markedString "At `Sonova`, I created an interactive SVG document (via the D3.js `JavaScript` library) for `teaching` our network topology of production/test servers and databases"
            , markedString "At `Sonova`, I designed and used SVG icons for a hybrid HTML desktop app"
            , markedString "For `Forks in the Road`, I began my `visual design` by creating SVG mockup in Inkscape"
            , markedString "For `My Portfolio and Resume`, I created SVG illustrations in `Elm`—animating them using `CSS`"
            ]
            portfolioOnly
        , TechItemData
            "system architecture"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "test-driven development"
            (Just "TDD")
            (markedString "I’ve done TDD and experienced its benefits. (I’m still working at using it more often.)")
            [ markedString "At `Sonova` with `C#`, I followed test-driven development to build a test run comparison tool"
            , markedString "In `Pentagram` with `Scala`, I wrote an initial parser using TDD"
            , markedString "In `Forks in the Road` with Ruby, I used TDD to add back-end functionality"
            ]
            (portfolioAndResume [ GeneralResume, ElmResume, GoResume ])
        , TechItemData
            "technical requirements"
            Nothing
            (markedString "I’m comfortable using technical requirements documents as a communication medium:")
            [ markedString "I’ve used official specs to write software for H.264 video encoding/decoding (at `LSI Logic`), ANSI hearing instrument testing (at `Sonova`), and XMPP messaging"
            , markedString "At `Sonova`, I wrote clear technical requirements that included contextual information, discussed trade-offs of different solutions, and provided enough detail for correct implementation"
            , markedString "At `Sonova`, I used the technical requirements I’d written negotiating features and implementation details, `making` the software, and introducing the changes to QA"
            , markedString "For `bitfontmake`, I wrote a technical specification to document my custom image-based font format"
            ]
            portfolioOnly
        , TechItemData
            "threads"
            Nothing
            (markedString "I know how to write correct multithreading code, and how to debug threading issues. Threads, mutexes, semaphores, condition variables, and barriers are all familiar tools for me.")
            [ markedString "At `Sonova` with `C#` and WinForms, I used async/await to build Windows desktop applications that perform long-running tasks on background threads"
            , markedString "At `Sonova` with `C#`, I used Parallel LINQ as well as the Task Parallel Library to automatically coordinate background threads"
            , markedString "In `Yomikata` with C++ and Qt, I used threads and processes to unpack and decode images in the background while keeping the UI responsive"
            ]
            portfolioOnly
        , TechItemData
            "TypeScript"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "version control"
            Nothing
            (markedString "I track all of my code with version control:")
            [ markedString "I have experience using Git, SVN, Bazaar, ClearCase, and AccuRev"
            , markedString "I use history annotations for `learning` where code came from and why"
            , markedString "I use change bisection to pinpoint the source of tricky bugs"
            , markedString "I write clear and descriptive commit messages, and use references to external issue tracking systems"
            ]
            portfolioOnly
        , TechItemData
            "visual design"
            Nothing
            (markedString "I use visual design to help my software communicate effectively:")
            [ markedString "I draw my own UI mockups, colour/typography schemes, icons, and logos using Inkscape (`SVG` editing software)"
            , markedString "With `My Portfolio and Resume`, I used `CSS` to create a printable and highly-readable resume that doesn’t follow the standard single column layout"
            , markedString "With `Off-Grid Orcs`, I designed and implemented my first font, with a glyph size of 6x6 pixels"
            ]
            (portfolioAndResume [ ElmResume ])
        , TechItemData
            "WebSockets"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        ]
    , portfolioOutro = Nothing
    }
