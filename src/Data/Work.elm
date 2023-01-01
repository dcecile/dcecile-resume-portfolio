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
                "May 2018 – November 2022"
                [ "Python / Django / TypeScript / React"
                , "Kubernetes / PostgreSQL / Redis / GCP"
                , "system architecture / product thinking / shipping"
                ]
                [ markedString "Collaboratively designed and implemented a new secure, scalable, `event-oriented`, multi-tenant architecture for our chatbot platform built on `Python`, `WebSockets`, `Redis Streams`, `PostgreSQL`, `Kubernetes`, and `GCP`"
                , markedString "Enabled surge scale-up using `Gatling` tests, custom work-limiting metrics, and `Kubernetes` HPA"
                , markedString "Created `React / TypeScript` and `Flutter` chat SDKs, including UX and API design for innovative new features"
                , markedString "Drastically reduced end-to-end platform latency through benchmarking and `source-level profiling`"
                , markedString "Upgraded our `YAML / Jinja` workflow language, adding aliases, type checks, and tail calls for improved DX"
                , markedString "Coded `integrations` using `REST APIs` and `webhooks` with mocked payload and event stream tests"
                , markedString "Built a developer CLI (`Click`) and web console (`React`), connected to `nginx`, `Django`, `GraphQL`, and `Git`"
                , markedString "Launched a `React / Rappid` visual flow editor with templates, inline docs, and full programmability"
                , markedString "Boosted performance and unlocked key log searches by compiling `Lucene` to windowed, index-aware `SQL`"
                , markedString "Improved QC processes: `code reviews`, `unit tests`, `CI/CD`, staging releases, checklists, monitoring, and alerts"
                , markedString "Directly supported customers via Slack chat, async videos, `log tracing`, `debugging`, and `pair programming`"
                , markedString "Managed own solo projects from brainstorming, design, coding, documentation, to release and onboarding"
                ]
                (markedString "I was a member of the team at Meya for more than 4 years, working on a chatbot platform that customers used to build and launch great customer support.")
                [ markedString "I co-designed a new architecture for our platform, with `scale`, `security`, and `event streams` at the core"
                , markedString "I worked on implementing our back-end using `Python`, `WebSockets`, `Redis`, `PostgreSQL`, `Kubernetes`, and `Google Cloud Platform`"
                , markedString "I created and maintained our chat UI SDKs for web (`React`, `TypeScript`) and mobile (`Flutter`)"
                , markedString "Experience in `domain-specific languages`: I built the 2nd-generation parser, engine, and static checks for our custom workflow language"
                , markedString "I helped improved our QC processes: `code review`, unit `testing`, `continuous integration & deployment`, staging releases, checklists, and `monitoring`"
                , markedString "I directly supported customers via Slack chat, async video clips, `log tracing`, `debugging`, and `pair programming`"
                ]

        sonova =
            WorkItemData
                "Sonova"
                "8 years"
                "Software Developer, Senior Software Developer"
                "December 2009 – January 2018"
                [ "C# / WinForms / HTML / SQL"
                , "data analysis / communication"
                , "coordination / leadership / mentoring"
                ]
                [ markedString "Developed `C#` hearing instrument manufacturing software, with `code reviews`, `integration/unit tests`, and `CI`"
                , markedString "Collaborated on `requirements`, `integrations`, and `debugging` with dev teams and production staff worldwide"
                , markedString "Created and optimized ad hoc data analysis `SQL` queries, to investigate bugs and business concerns"
                , markedString "Triaged tasks, coordinated iterations, prepared releases, built internal tools, and mentored team members"
                ]
                (markedString "I worked with my team at Sonova for 8 years, `making` hearing instrument manufacturing software.")
                [ markedString "I used `C#` for software implementation and maintenance, and `SQL` + Excel for `analyzing` data"
                , markedString "I mitigated bugs using integration `testing`, actively listening, and thoroughly `learning` business/software systems"
                , markedString "I built a hybrid HTML and `C#` desktop application to replace a paper-based inspection process"
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
                [ markedString "Wrote tests, fixed CRM bugs in Scheme"
                , markedString "Pair programmed to find and fix bugs"
                , markedString "Simplified WiX installer using Java"
                , markedString "Tested Windows Installers"
                ]
                (markedString "My final internship was with teams at NexJ Systems, `making` customer relationship management software:")
                [ markedString "I used Java for `improving` an Ant + WiX installer build system"
                , markedString "I investigated and fixed client-critical bugs in Scheme"
                , markedString "I did business logic unit `testing` in Scheme"
                ]

        coreworx =
            WorkItemData
                "Coreworx"
                "8 months (internship)"
                "Software Developer"
                "internship, 2006–2007"
                [ "C# / SQL"
                ]
                [ markedString "Automated database migration via `SQL`"
                , markedString "Tested an ASP.NET DMS application"
                , markedString "Developed DMS personalization in `C#`"
                , markedString "Learned the keys to effective bug reporting"
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
                [ markedString "Created a DSP log analysis tool in C++"
                , markedString "Implemented 'video debugger' features in C"
                , markedString "Fixed H.264 video decoder bugs in C"
                ]
                (markedString "My first internship was with the team at LSI Logic, `making` H.264 video decoders and encoders:")
                [ markedString "I began by reading the H.264 spec, `learning` how video encoding works"
                , markedString "I fixed video decoder bugs in C"
                , markedString "I implemented video debugger features in C"
                , markedString "I created an internal tool for analyzing the logs of a digital-signal-processor pipeline simulation in C++"
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
