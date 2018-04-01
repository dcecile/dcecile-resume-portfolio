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
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioOnly
        , TechItemData
            "CSS3"
            Nothing
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
            PortfolioAndResume
        , TechItemData
            "domain-specific languages"
            (Just "DSLs")
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
            [ markedString "At `Unitron`, functional programming made `test-driven development` easier to apply for a numeric comparison `C#` GUI app"
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
            , markedString "(Recently I’ve been using the related `C#` and `Scala` languages more than Java)"
            ]
            PortfolioOnly
        , TechItemData
            "Java"
            Nothing
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
            , markedString "(Recently I’ve been more focused on `HTML5` instead of Qt)"
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
