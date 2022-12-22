module Data.Mindsets exposing
    ( MindsetsData
    , MindsetsItemData
    , initMindsetsData
    )

import Data.Section exposing (SectionData)
import MarkedString exposing (MarkedString, markedString)


type alias MindsetsData =
    SectionData
        { making : MindsetsItemData
        , learning : MindsetsItemData
        , teaching : MindsetsItemData
        , analyzing : MindsetsItemData
        , coordinating : MindsetsItemData
        , improving : MindsetsItemData
        , items : List MindsetsItemData
        }


type alias MindsetsItemData =
    { name : String
    , detailsIntro : MarkedString
    , detailsPoints : List MarkedString
    }


initMindsetsData : MindsetsData
initMindsetsData =
    let
        making =
            MindsetsItemData
                "making"
                (markedString "The reason I’m a software developer is because I enjoy making ideas come alive as working software:")
                [ markedString "At `Sonova Group`, I made manufacturing software in `C#`—by listening for details hidden behind rough wishes, then building solutions to fit the needs and the context"
                , markedString "With `Off-Grid Orcs`, I created an `HTML` Canvas `Scala` game—from concept to release—during a 17-day game jam"
                , markedString "With `Forks in the Road`, I’m making a `Rails` + `React` web app that helps users make decisions via probability-based value estimation"
                , markedString "With `My Portfolio and Resume`, I turned my simple sketches into multi-element, animated `SVG` illustrations"
                , markedString "I’m volunteering as a makerspace assistant, `teaching` kids how they can also be makers"
                ]

        learning =
            MindsetsItemData
                "learning"
                (markedString "My curiosity and my passion for `improving` my work motivate me to always continue learning:")
                [ markedString "At `Sonova Group`, I learned the keys to effective communication in a large, geographically-distributed organization"
                , markedString "In `Forks in the Road`, I learned how to use JWT authentication for an API-only `Rails` app"
                , markedString "In `Off-Grid Orcs`, I learned how to apply a `functional programming` architecture to a real-time `Scala` strategy game"
                , markedString "In `Yomikata`, I learned how to use multiple processes and `threads` in `C++`, to give a smooth user experience while loading images"
                ]

        teaching =
            MindsetsItemData
                "teaching"
                (markedString "I help others learn by breaking complex topics down into pieces that they understand:")
                [ markedString "At `Sonova Group`, I used my knowledge of related business and software systems to teach others how to avoid bugs and perform more thorough tests"
                , markedString "At `Sonova Group`, I used code reviews as teaching opportunities, to help my teammates improve their `C#` code maintainability"
                , markedString "At `NexJ Systems`, I pair programmed to fix bugs by teaching my partner to see the causes and effects that I saw"
                , markedString "As a volunteer makerspace assistant, I teach kids the skills required to succeed at (and enjoy) each maker activity"
                ]

        analyzing =
            MindsetsItemData
                "analyzing"
                (markedString "At `Sonova Group`, my team often encountered questions that could only be answered by analyzing production data. Using a combination of `SQL` and `Excel`,")
                [ markedString "I researched the value of maintaining software solutions vs. the cost of setting up manual workarounds"
                , markedString "I investigated the hardware component causes of firmware bugs"
                , markedString "I communicated my findings using easy-to-understand tables, charts, and summaries"
                , markedString "I created reports and internal tools to help others carry out their own analysis tasks"
                , markedString "I expanded test coverage using real-world test cases"
                ]

        coordinating =
            MindsetsItemData
                "coordinating"
                (markedString "As a Senior Software Developer at `Sonova Group`, I helped keep everyone on the same page:")
                [ markedString "I worked with developers, QA, and project management to coordinate software release milestones"
                , markedString "I worked on-site with production managers to negotiate and coordinate custom software solutions"
                , markedString "I worked with developers and technical support to coordinate patch releases"
                , markedString "I clearly documented all findings, discussions, action items, and status information in our issue tracking system"
                , markedString "I used a custom spreadsheet plus reports from our issue tracking system to manage and communicate timelines"
                ]

        improving =
            MindsetsItemData
                "improving"
                (markedString "When I work on a project, I always look for potential improvements that have good cost/benefit value:")
                [ markedString "At `Sonova Group`, I listened for pain points in our daily work, and led improvements to development and QA team processes"
                , markedString "At `NexJ Systems`, I improved the Ant+WiX installer build system to reduce required maintenance"
                , markedString "In `Forks in the Road`, I improved my initial `React` implementation by converting components to use `functional programming`"
                , markedString "In `Ultra Rainbow Bake Sale`, I listened to player feedback, and created dynamic hints to improve the experience for new players"
                ]
    in
    { id = "mindsets"
    , name = "Mindsets"
    , portfolioIconBackground = .eye
    , detailsNoun = "mindset"
    , portfolioIntro =
        "Because I see building software as more than just writing code, I use all of these mindsets as I work:"
    , making = making
    , learning = learning
    , teaching = teaching
    , analyzing = analyzing
    , coordinating = coordinating
    , improving = improving
    , items =
        [ making
        , learning
        , teaching
        , analyzing
        , coordinating
        , improving
        ]
    , portfolioOutro = Nothing
    }
