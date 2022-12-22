module Data.Work exposing
    ( WorkData
    , WorkItemData
    , initWorkData
    )

import Data.Section exposing (SectionData)
import MarkedString exposing (MarkedString, markedString)


type alias WorkData =
    SectionData
        { portfolioItems : List WorkItemData
        , portfolioLargeItems : List WorkItemData
        , portfolioSmallItems : List WorkItemData
        , resumeItems : List WorkItemData
        }


type alias WorkItemData =
    { name : String
    , portfolioDuration : String
    , resumeTitle : String
    , resumePeriod : String
    , portfolioSkills : List String
    , resumePoints : List MarkedString
    , detailsIntro : MarkedString
    , detailsPoints : List MarkedString
    }


initWorkData : WorkData
initWorkData =
    let
        meya =
            WorkItemData
                "Meya"
                "4 years"
                "Software Engineer"
                "2018–2022"
                [ "Python / Django / TypeScript / React"
                , "PostgreSQL / Redis / Kubernetes / GCP"
                , "system architecture / product thinking / shipping"
                ]
                [ markedString "Designed and implemented a new secure, scalable, event-oriented, multi-tenant architecture for our chatbot platform using `Python`, `NaCl`, `WebSockets`, `Redis Streams`, `PostgreSQL`, and `Kubernetes`"
                , markedString "Created `React / TypeScript` and `Flutter` chat UI SDKs, server-programmable via a custom `YAML / Jinja` DSL"
                , markedString "Drastically improved end-to-end platform latency through benchmarking and source-level profiling"
                , markedString "Enabled surge scale-up using `Gatling` tests, custom work-limiting metrics, and `Kubernetes` HPA"
                , markedString "Coded and maintained deep integrations with external services via `REST APIs` and `webhooks`"
                , markedString "Created a developer `Ant Design / React` web console and `Click` CLI connected to `Nginx`, `GraphQL`, and `Git`"
                , markedString "Launched two iterations of a new company website using `Next.js`, `Node.js`, and `Prismic CMS`"
                , markedString "Directly supported customers through Slack chat, async video clips, log tracing, and pair programming"
                , markedString "Managed own solo projects through brainstorming, design, coding, release, and customer onboarding"
                ]
                (markedString "TODO")
                [ markedString "TODO"
                ]

        sonova =
            WorkItemData
                "Sonova Group"
                "8 years"
                "Software Developer, Senior Software Developer"
                "2009–2018"
                [ "C# / WinForms / HTML / SQL"
                , "data analysis / communication"
                , "coordination / leadership / mentoring"
                ]
                [ markedString "Collaborated closely with dev teams and production staff worldwide, building `C#` manufacturing subsystems designed to support the launch and service of our full range of hearing instruments"
                , markedString "Retrofitted multiple desktop apps to support `i18n`, managed `l10n` processes and tools"
                , markedString "Analyzed data with ad-hoc `SQL` queries to investigate bugs and business concerns"
                , markedString "Presented technical summaries (with appropriate data visualization) to managers and other teams"
                , markedString "Triaged tasks, coordinated iterations, improved processes, and mentored team members"
                ]
                (markedString "I worked with my team at Sonova Group for 8 years, `making` hearing instrument manufacturing software.")
                [ markedString "I used `C#` for software implementation and maintenance, and `SQL` + `Excel` for `analyzing` data"
                , markedString "I mitigated bugs writing integration tests, actively listening to stakeholders, and thoroughly `learning` business/software systems"
                , markedString "I built a hybrid `HTML` and `C#` desktop application to replace a paper-based inspection process"
                , markedString "I followed `test-driven development` to build a test run comparison tool that saved weeks of manual effort"
                , markedString "Also: negotiating solutions, documenting `technical requirements`, `coordinating` development cycles, `improving` team processes, mentoring and `teaching` peers"
                ]

        nexj =
            WorkItemData
                "NexJ Systems"
                "8 months (internship)"
                "Developer, Application Developer"
                "internship, 2008"
                [ "Java / Scheme"
                ]
                [ markedString "Simplified WiX installer using `Java`"
                , markedString "Wrote tests, fixed CRM bugs in `Scheme`"
                ]
                (markedString "My final internship was with teams at NexJ Systems, `making` customer relationship management software:")
                [ markedString "I used `Java` for `improving` an Ant + WiX installer build system"
                , markedString "I investigated and fixed client-critical bugs in `Scheme`"
                , markedString "I wrote business logic unit tests in `Scheme`"
                ]

        coreworx =
            WorkItemData
                "Coreworx"
                "8 months (internship)"
                "Software Developer"
                "internship, 2006–2007"
                [ "C# / SQL"
                ]
                [ markedString "Developed DMS personalization in `C#`"
                , markedString "Automated database migration via `SQL`"
                ]
                (markedString "I interned with the team at Coreworx, `making` an ASP.NET document management system:")
                [ markedString "I helped develop a personalization system in `C#`"
                , markedString "I automated an Oracle database migration via `SQL`"
                , markedString "I ran manual regression tests, `learning` the fundamentals of good `bug reporting`"
                ]

        lsi =
            WorkItemData
                "LSI Logic"
                "8 months (internship)"
                "Software Engineer"
                "internship, 2005–2006"
                [ "C / C++"
                ]
                [ markedString "Fixed H.264 video decoder bugs in `C`"
                , markedString "Created a DSP log analysis tool in `C++`"
                ]
                (markedString "My first internship was with the team at LSI Logic, `making` H.264 video decoders and encoders:")
                [ markedString "I began by reading the H.264 spec, `learning` how video encoding works"
                , markedString "I fixed video decoder bugs in `C`"
                , markedString "I implemented video debugger features in `C`"
                , markedString "I created an internal tool for analyzing the logs of a digital-signal-processor pipeline simulation in `C++`"
                ]

        portfolioLargeItems =
            [ meya
            , sonova
            ]

        portfolioSmallItems =
            [ nexj
            , coreworx
            , lsi
            ]
    in
    { id = "work"
    , name = "Work history"
    , portfolioIconBackground = .calendar
    , detailsNoun = "team"
    , portfolioIntro =
        "These are the teams that I’ve contributed to and learned from:"
    , portfolioItems = portfolioLargeItems ++ portfolioSmallItems
    , portfolioLargeItems = portfolioLargeItems
    , portfolioSmallItems = portfolioSmallItems
    , resumeItems =
        [ meya
        , sonova
        ]
    , portfolioOutro =
        Just "Want more details about my skills? Keep reading for my mindsets, tech skills, and side projects…"
    }
