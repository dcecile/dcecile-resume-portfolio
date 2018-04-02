module Data.Work
    exposing
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
        , resumeVolunteerItems : List WorkItemData
        }


type alias WorkItemData =
    { name : String
    , resumeLocation : String
    , portfolioDuration : String
    , portfolioTitles : List String
    , resumeTitlePeriods : List ( String, String )
    , portfolioSkills : List String
    , resumePoints : List MarkedString
    , detailsIntro : MarkedString
    , detailsPoints : List MarkedString
    }


initWorkData : WorkData
initWorkData =
    let
        unitron =
            WorkItemData
                "Unitron"
                "Kitchener, Ontario"
                "8 years"
                [ "Software Developer"
                , "Senior Software Developer"
                ]
                [ ( "Software Developer", "2009–2013" )
                , ( "Senior Software Developer", "2013–2018" )
                ]
                [ "C# / WinForms / HTML /"
                , "SQL / Excel / data analysis /"
                , "communication / coordination /"
                , "leadership / mentoring"
                ]
                [ markedString "Coded manufacturing subsystems in `C#`"
                , markedString "Built a hybrid `HTML / C#` desktop app"
                , markedString "Investigated bugs using `SQL` and `Excel`"
                , markedString "Negotiated and documented requirements"
                , markedString "Coordinated team’s development cycles"
                , markedString "Led key improvements in team processes"
                , markedString "Mentored team members"
                ]
                (markedString "I worked with my team at Unitron for 8 years, `making` hearing instrument manufacturing software.")
                [ markedString "I used `C#` for software implementation and maintenance; `SQL` and `Excel` for `analyzing` data"
                , markedString "I mitigated bugs by writing integration tests, and by thoroughly `learning` related business/software systems"
                , markedString "I built a hybrid `HTML` and `C#` desktop application to replace a paper-based inspection process"
                , markedString "I followed `test-driven development` to build a test run comparison tool that saved weeks of manual effort"
                , markedString "Also: negotiating and documenting requirements, `coordinating` development cycles, `improving` team processes, mentoring & `teaching` peers"
                ]

        nexj =
            WorkItemData
                "NexJ Systems"
                "Toronto, Ontario"
                "8 months"
                [ "co-op"
                ]
                [ ( "Developer", "winter co-op, 2008" )
                , ( "Application Developer", "fall co-op, 2008" )
                ]
                [ "Java / Scheme"
                ]
                [ markedString "Simplified WiX installer using `Java`"
                , markedString "Wrote tests, fixed CRM bugs in `Scheme`"
                ]
                (markedString "My final two co-op terms were with teams at NexJ Systems, `making` customer relationship management software:")
                [ markedString "I worked at `improving` an Ant + WiX installer build system, using `Java`"
                , markedString "I investigated and fixed client-critical bugs, in `Scheme`"
                , markedString "I wrote business logic unit tests, in `Scheme`"
                ]

        coreworx =
            WorkItemData
                "Coreworx"
                "Kitchener, Ontario"
                "8 months"
                [ "co-op"
                ]
                [ ( "Software Developer", "co-op, 2006/2007" )
                ]
                [ "C# / SQL"
                ]
                [ markedString "Developed DMS personalization in `C#`"
                , markedString "Automated database migration via `SQL`"
                ]
                (markedString "I had two co-op terms with the team Coreworx, `making` an ASP.NET document management system:")
                [ markedString "I helped develop a personalization system, in `C#`"
                , markedString "I automated an Oracle database migration, via `SQL`"
                , markedString "I ran manual regression tests, `learning` the fundamentals of good `bug reporting`"
                ]

        lsi =
            WorkItemData
                "LSI Logic"
                "Waterloo, Ontario"
                "8 months"
                [ "co-op"
                ]
                [ ( "Software Engineer", "co-op, 2005/2006" )
                ]
                [ "C / C++"
                ]
                [ markedString "Fixed H.264 video decoder bugs in `C`"
                , markedString "Created a DSP log analysis tool in `C++`"
                ]
                (markedString "My first co-op experience was with the team at LSI Logic, `making` H.264 video decoders and encoders:")
                [ markedString "I began by reading the H.264 spec, `learning` how video encoding works"
                , markedString "I fixed video decoder bugs, in `C`"
                , markedString "I implemented video debugger features, in `C`"
                , markedString "I created an internal tool for analyzing the logs of a digital-signal-processor pipeline simulation, in `C++`"
                ]

        themusuem =
            WorkItemData
                "THEMUSEUM"
                "Kitchener"
                ""
                []
                [ ( "Makerspace Assistant", "2017–now" )
                ]
                []
                [ markedString "Helping lead maker workshops"
                , markedString "Teaching kids STEAM mindsets"
                ]
                []
                []

        portfolioLargeItems =
            [ unitron
            ]

        portfolioSmallItems =
            [ nexj
            , coreworx
            , lsi
            ]
    in
    { id = "work"
    , name = "Work history"
    , iconBackground = .calendar
    , intro =
        "These are the teams that I’ve contributed to and learned from:"
    , portfolioItems = portfolioLargeItems ++ portfolioSmallItems
    , portfolioLargeItems = portfolioLargeItems
    , portfolioSmallItems = portfolioSmallItems
    , resumeItems =
        [ unitron
        , nexj
        , coreworx
        , lsi
        ]
    , resumeVolunteerItems =
        [ themusuem
        ]
    , outro =
        Just "Want more details about my skills? Keep reading for my mindsets, tech fluency, and side projects."
    }
