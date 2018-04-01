module Data.Mindsets
    exposing
        ( MindsetsData
        , MindsetsItemData
        , initMindsetsData
        )

import Data.Section exposing (SectionData)
import MarkedString exposing (MarkedString, markedString)


type alias MindsetsData =
    SectionData
        { items : List MindsetsItemData
        }


type alias MindsetsItemData =
    { name : String
    , detailsIntro : MarkedString
    , detailsPoints : List MarkedString
    }


initMindsetsData : MindsetsData
initMindsetsData =
    { id = "mindsets"
    , name = "Mindsets"
    , iconBackground = .eye
    , intro =
        "Because I see building software as more than just writing code, I use all of these mindsets as I work:"
    , items =
        [ MindsetsItemData
            "making"
            (markedString "The reason I’m a software developer is because I enjoy making abstract ideas come alive as working software:")
            [ markedString "At `Unitron`, I made manufacturing software in `C#`, from requirements negotiation to implementation to QA and production hand-off"
            , markedString "With `Forks in the Road`, I’m making a `Rails` + `React` web app that computes probabilistic rankings"
            , markedString "With `Off-Grid Orcs`, I made an `HTML5` `Scala` game during a 17-day game jam"
            , markedString "I’m volunteering as a makerspace assistant, `teaching` kids how they can also be makers"
            ]
        , MindsetsItemData
            "learning"
            (markedString "My curiosity and my passion for `improving` my work motivate me to always continue learning:")
            [ markedString "At `Unitron`, I learned the keys to effective communication in a large, geographically-distributed organization"
            , markedString "In `Forks in the Road`, I learned how to use JWT authentication for an API-only `Rails` app"
            , markedString "In `Off-Grid Orcs`, I learned how to apply a `functional programming` architecture to a highly-interactive `Scala` application"
            , markedString "In `Yomikata`, I learned how to use multiple processes and threads in `C++`, to give a smooth user experience while loading images"
            ]
        , MindsetsItemData
            "teaching"
            (markedString "I take complex topics and break them down into pieces that others understand:")
            [ markedString "At `Unitron`, I used my knowledge of related business and software systems to teach others how to avoid bugs and perform more thorough tests"
            , markedString "At `Unitron`, I used code reviews as teaching opportunities, to help my teammates improve their `C#` code maintainability"
            , markedString "At `NexJ Systems`, I learned that pair programming to fix bugs is all about teaching your partner to see the causes and effects that you see"
            , markedString "As a volunteer makerspace assistant, I teach kids the skills required to succeed at (and enjoy) each maker activity"
            ]
        , MindsetsItemData
            "analyzing"
            (markedString "At `Unitron`, my team often encountered questions that could only be answered analyzing production data. Using a combination of `SQL` and `Excel`,")
            [ markedString "I calculated the value of maintaining software solutions vs. the cost of setting up manual workarounds"
            , markedString "I investigated the hardware component causes of software-level bugs"
            , markedString "I expanded test coverage using real-world test cases"
            , markedString "I proposed new quality tolerances based on historic measurements"
            ]
        , MindsetsItemData
            "coordinating"
            (markedString "At `Unitron`, one of my responsibilities as a Senior Software Developer was to help keep everyone on the same page:")
            [ markedString "I worked with developers, QA, and project management to coordinate software release milestones"
            , markedString "I worked on-site with production managers to negotiate and coordinate custom software solutions"
            , markedString "I worked with developers and technical support to coordinate hot-fix releases"
            ]
        , MindsetsItemData
            "improving"
            (markedString "When I work on a project, I always look for potential improvements that have good cost/benefit value:")
            [ markedString "At `Unitron`, I led key improvements to team processes for development and QA"
            , markedString "At `NexJ Systems`, I improved the Ant+WiX installer build system to require less maintenance"
            , markedString "In `Forks in the Road`, I improved my initial `React` implementation by converting components to use `functional programming`"
            , markedString "In `Ultra Rainbow Bake Sale`, I improved the experience for new players by creating a dynamic hints system"
            ]
        ]
    , outro = Nothing
    }
