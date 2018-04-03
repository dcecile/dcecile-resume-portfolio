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
        "I’m serious about learning new skills and improving my old ones. (New skills bring new perspectives and open new doors—old skills hide the keys to mastery.)"
    , items =
        [ TechItemData
            "Bootstrap"
            Nothing
            (markedString "This component library is a new addition to my `visual design` toolbox. I’ve used it for two projects so far:")
            [ markedString "With `/tmp/blog`, I used Bootstrap’s “cards” for attention-grabbing calls to action"
            , markedString "In `Forks in the Road`, I’m taking advantage of Bootstrap’s excellent form input controls"
            ]
            PortfolioOnly
        , TechItemData
            "bug reporting"
            Nothing
            (markedString "Writing clear and helpful bug reports is a key skill for any member of a software development team, and it’s one that I’ve been practising since my second co-op job:")
            [ markedString "At `Coreworx`, during my time helping QA with testing, I learned the keys to effective bug reporting"
            , markedString "At `Unitron`, I continued to work at `improving` my bug reporting as I started logging bugs for software components created by other teams"
            , markedString "At `Unitron`, I regularly triaged my team’s bugs, and spent time `teaching` others what to fix for unclear bug reports"
            ]
            PortfolioOnly
        , TechItemData
            "C"
            Nothing
            (markedString "I can read and write C code:")
            [ markedString "At university, I used C to add virtual memory features to an operating system"
            , markedString "At `LSI Logic`, I used C to add features to a visual H.264 video debugger"
            , markedString "At `LSI Logic`, I used C to fix H.264 video decoder bugs"
            , markedString "(Recently I’ve been using the related `C#` and `Go` languages more than C)"
            ]
            PortfolioOnly
        , TechItemData
            "C++"
            Nothing
            (markedString "C++ in high school was when I learned how pointers work. It was also my first exposure to generic programming.")
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
            , markedString "After experiencing the benefit of continually-deployed ClickOnce internal tools at `Unitron`, I’ve set up `Forks in the Road` and `My Portfolio and Resume` for continuous deployment using Semaphore"
            ]
            PortfolioOnly
        , TechItemData
            "code review"
            Nothing
            (markedString "With my team at `Unitron`, every change required the approval of two reviewers before being committed to `version control`:")
            [ markedString "This offered excellent opportunities for `learning` and `teaching` about code maintainability as well as specific software features, components, and technologies"
            , markedString "Diligently using code reviews was a key step in `improving` the quality of our software"
            , markedString "We found that the time spent on reviews was a net positive for our team’s productivity"
            , markedString "(We mainly used SmartBear’s Collaborator, and sometimes used GitHub)"
            ]
            PortfolioOnly
        , TechItemData
            "CSS"
            Nothing
            (markedString "These days, my primary tool for `visual design` is CSS for `HTML` web applications:")
            [ markedString "At `Unitron`, I used CSS to implement a hybrid `HTML` desktop app according to initial mockups"
            , markedString "In `PR Quest` and `Forks in the Road`, I’ve leveraged my `Qt` experience to set up CSS flexbox layouts"
            , markedString "In `/tmp/blog` and `PR Quest`, I use CSS3 media queries for `responsive design`"
            , markedString "With `Reactic-Tac-Toe` and `Forks in the Road`, I’m `learning` how to do `functional animation` with CSS3 transitions and animations"
            , markedString "I’m a fan of Block Element Modifier for organization"
            , markedString "(I’ve also been using CSS via `Sass` and `domain-specific languages` in `Elm` and `Scala`)"
            ]
            PortfolioAndResume
        , TechItemData
            "domain-specific languages"
            (Just "DSLs")
            (markedString "I have experience both using and creating DSLs:")
            [ markedString "At `NexJ Systems`, I used an in-house `Scheme` DSL with all of my work on the CRM user interface and business logic"
            , markedString "At `Unitron`, I created a `C#` DSL for specifying related test plans—to improve maintainability and track history in `version control`"
            , markedString "With `My Portfolio and Resume` and `Tacit`, I’m using `Elm` and `Scala` DSLs for writing `HTML` and `CSS` code"
            , markedString "With `Tacit`, I’m creating a small DSL for each transformation that the compiler applies"
            ]
            PortfolioOnly
        , TechItemData
            "Elm"
            Nothing
            (markedString "Elm is a front-end framework and `functional programming` language that I’m `learning` as I make `My Portfolio and Resume`.")
            []
            PortfolioOnly
        , TechItemData
            "Excel"
            Nothing
            (markedString "At `Unitron`, I used Excel together with `SQL` for `analyzing` data:")
            [ markedString "I used Excel pivot tables and pivot charts to explore trends and correlations"
            , markedString "I copied Excel table and chart summaries into emails—to help explain the data to managers"
            , markedString "I linked Excel to directly `SQL` tables and views, to create live reports"
            ]
            PortfolioOnly
        , TechItemData
            "functional programming"
            (Just "FP")
            (markedString "I use this programming style because it helps me cleanly extract sub-problems:")
            [ markedString "At `NexJ Systems`, I had my first, basic introduction to functional programming as I used `Scheme` to fix bugs and write unit tests"
            , markedString "At `Unitron`, functional programming made `test-driven development` easier to apply for a test run comparison `C#` GUI app"
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
            (markedString "I’m using Go with `Google App Engine` for the back-end for `Tiny Worker Bee`, a Twitter content library that post Tweets according to a dynamically-determined schedule.")
            []
            PortfolioOnly
        , TechItemData
            "Heroku"
            Nothing
            (markedString "I’ve deployed both of my `Rails` apps, `/tmp/blog/` and `Forks in the Road`, to Heroku (using Postgres as my `SQL` database), along with one `Python` Flask service (`bitfontmake`).")
            []
            PortfolioOnly
        , TechItemData
            "HTML"
            Nothing
            (markedString "I’m `making` web applications with HTML, `CSS`, and `JavaScript`:")
            [ markedString "At `Unitron`, as an experiment with a new GUI technology beyond `WinForms` and WPF, I created a hybrid HTML and `C#` desktop application (not using Chrome + Electron, but using a custom IE + .NET WebBrowser control integration)"
            , markedString "With `Forks in the Road`, I’m making a `Rails` and `React` web app that does probabilistic rankings"
            , markedString "With `PR Quest`, I used `Vue.js` (with an HTML5 History API router) to create a single-page application that can be navigated without page loads"
            , markedString "Other web apps I’ve made: `Forks in the Road`, `My Portfolio and Resume`, `Off-Grid Orcs`, `Reactic-Tac-Toe`, `Tacit`, `Tiny Worker Bee`, `/tmp/blog`"
            ]
            PortfolioOnly
        , TechItemData
            "internationalization & localization"
            (Just "i18n & l10n")
            (markedString "On my team at `Unitron`, I was in charge of our translation processes:")
            [ markedString "I converted our primary `WinForms` software from hard-coded English to supporting Chinese and German, including on-the-fly language changes"
            , markedString "I added basic right-to-left language support to our secondary-market `WinForms` software"
            , markedString "I managed the localization of our software plus another team's software, `coordinating` translator activities for up to 14 languages"
            , markedString "I worked at continually `improving` our translation workflow with process changes and `C#` tooling"
            ]
            PortfolioOnly
        , TechItemData
            "Java"
            Nothing
            (markedString "I can read and write Java 6 code:")
            [ markedString "At university, I used Java in my first programming classes"
            , markedString "At `NexJ Systems`, I used Java to improve an Ant + WiX installer build system"
            , markedString "(Recently I’ve been using the related `C#` and `Scala` languages more than Java)"
            ]
            PortfolioOnly
        , TechItemData
            "JavaScript"
            Nothing
            (markedString "I use JavaScript for most of my front-end development, with language features like modules, await, and classes provided by Babel:")
            [ markedString "At `Unitron`, I used JavaScript for the UI logic of a hybrid `HTML` and `C#` desktop app"
            , markedString "In `Forks in the Road`, I’m using JavaScript with `React` for the front-end of my probabilistic ranking web app"
            , markedString "In `Tiny Worker Bee`, I’m using JavaScript with `Vue.js` for the front-end of my Twitter content library web app"
            , markedString "In `PR Quest`, I used JavaScript with `Vue.js` to build a static-content single page application"
            , markedString "(I sometimes use `Elm` or `Scala` instead of JavaScript)"
            ]
            PortfolioAndResume
        , TechItemData
            "Linux"
            Nothing
            (markedString "I’m comfortable working in Linux, having used it for my primary development environment since university:")
            [ markedString "I know my way around the command line (e.g. for `version control`)"
            , markedString "I have some experience making cross-platform desktop applications: `Ultra Rainbow Bake Sale` and `Yomikata`"
            ]
            PortfolioOnly
        , TechItemData
            "Lua"
            Nothing
            (markedString "For `Ultra Rainbow Bake Sale`, I finally learned Lua and used it with LÖVE to build a single-player, deck-building, baking game.")
            []
            PortfolioOnly
        , TechItemData
            "Python"
            Nothing
            (markedString "With `bitfontmake`, I’ve used Python to compile my TTF fonts from a custom pixel-based input format. This code is deployed on `Heroku` as a Flask application.")
            []
            PortfolioAndResume
        , TechItemData
            "Qt"
            Nothing
            (markedString "My first `Linux` distro was Kubuntu—from using KDE I got curious about `making` my own desktop applications in Qt:")
            [ markedString "From 2007 to 2009, I used Qt Widget to create my `Yomikata` comic book and manga reader"
            , markedString "In 2016, I learned enough Qt Quick to start creating a management simulation game"
            , markedString "(Recently I’ve been more focused on `HTML` instead of Qt)"
            ]
            PortfolioOnly
        , TechItemData
            "React"
            Nothing
            (markedString "I’m `learning` React to get experience with today’s most popular front-end framework (according to The State of JavaScript 2017):")
            [ markedString "I used `Reactic-Tac-Toe` to learn the basics of creating React components"
            , markedString "With `Forks in the Road`, I’m using React to create the front-end of my probabilistic ranking web app"
            , markedString "(I’ve also used `Vue.js` and `Elm` for creating `HTML` front-ends)"
            ]
            PortfolioAndResume
        , TechItemData
            "responsive design"
            Nothing
            (markedString "The promise of `HTML` web apps is that they’ll run in any modern browser. I use responsive design to make sure that mobile devices are included too:")
            [ markedString "I’ve used `CSS` media queries for responsive design (by progressively enabling more advanced styling for larger screens) in `PR Quest`, `Reactic-Tac-Toe`, and `/tmp/blog`"
            ]
            PortfolioOnly
        , TechItemData
            "Ruby"
            Nothing
            (markedString "I’m `learning` Ruby so I can make `Rails` web apps. Right now that’s `Forks in the Road` and `/tmp/blog`.")
            []
            PortfolioAndResume
        , TechItemData
            "Rails"
            Nothing
            (markedString "I’m `learning` this `Ruby` framework for a peek into the tech behind some of my favourite web apps.")
            [ markedString "With `/tmp/blog`, I built my very first Rails app and deployed it to `Heroku`"
            , markedString "In `Forks in the Road`, I’m using Rails together with `React` to create a probabilistic ranking web app"
            ]
            PortfolioAndResume
        , TechItemData
            "Sass"
            Nothing
            (markedString "After using LESS at `Unitron`, and Stylus with `PR Quest` and `Tiny Worker Bee`, I’ve started using this `CSS` language to get smooth integration with `Bootstrap`:")
            [ markedString "For both `/tmp/blog` and `Forks in the Road`, I use Sass to take my application’s `CSS` classes—organized using Block Element Modifier—and extend them with `Bootstrap` styles"
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
            "Scala"
            Nothing
            (markedString "I’m using Scala as my “serious” `functional programming` language:")
            [ markedString "For my `Tacit` programming language, the support for `functional programming` from the type system and standard library has been great"
            , markedString "I used `Scala` and Scala.js to create `Off-Grid Orcs` as an HTML game with a `functional programming` architecture"
            ]
            PortfolioAndResume
        , TechItemData
            "Scheme"
            Nothing
            (markedString "Scheme was my introduction to the `functional programming` concept of higher-order functions. I used it at `NexJ Systems` to fix bugs and write unit tests.")
            []
            PortfolioOnly
        , TechItemData
            "test-driven development"
            (Just "TDD")
            (markedString "I’ve done TDD and experienced its benefits. (I’m still working at using it more often.)")
            [ markedString "At `Unitron` with `C#`, I followed test-driven development to build a test run comparison tool"
            , markedString "In `Tacit` with `Scala`, I wrote my initial parser using TDD"
            , markedString "In `Forks in the Road` with `Ruby`, I used TDD to add back-end functionality"
            ]
            PortfolioOnly
        , TechItemData
            "version control"
            Nothing
            (markedString "I track all of my code with version control:")
            [ markedString "I have experience using Git, SVN, Bazaar, ClearCase, and AccuRev"
            , markedString "I use history annotations for `learning` where code came from and why"
            , markedString "I use change bisection to pinpoint the source of tricky bugs"
            , markedString "I write clear and descriptive commit messages, and use references to external bug/feature tracking systems"
            ]
            PortfolioOnly
        , TechItemData
            "visual design"
            Nothing
            (markedString "I use visual design to try to help my software communicate effectively:")
            [ markedString "I use Inkscape (vector graphics software) to draw UI mockups and logos"
            , markedString "With `My Portfolio and Resume`, I tried using `CSS` to create a highly-readable resume that doesn’t follow the standard single column layout"
            , markedString "With `PR Quest`, I tried to create a professional-quality website with crisp typography and `responsive design`"
            , markedString "With `/tmp/blog`, I tried to create an attractive and inviting design focused around a monospace font"
            , markedString "With `Off-Grid Orcs`, I tried creating my first font, with a glyph size of 6x6 pixels"
            ]
            PortfolioOnly
        , TechItemData
            "Vue.js"
            Nothing
            (markedString "Before `learning` `React`, I learned this front-end framework and created two applications using it:")
            [ markedString "`PR Quest` is a static informational site (with search) about MP support for proportional representation"
            , markedString "`Tiny Worker Bee` is a Twitter content library that post Tweets according to a dynamically-determined schedule"
            ]
            PortfolioAndResume
        , TechItemData
            "WinForms"
            Nothing
            (markedString "My team at `Unitron` worked primarily in `C#` creating WinForms desktop software. Using this technology,")
            [ markedString "I created a user management module using DevExpress layouts and data-binding"
            , markedString "I built a test run comparison application, `improving` a process that previously included manual spreadsheet authoring"
            , markedString "I made an `SQL`-backed test run search and summary application, to help QA focus testing resources using production data"
            , markedString "I set up a semi-automated `internationalization & localization` workflow"
            ]
            PortfolioOnly
        ]
    , outro = Nothing
    }
