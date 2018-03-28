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
                [ "C# / WinForms / HTML5 /"
                , "SQL / Excel / data analysis /"
                , "communication / coordination /"
                , "leadership / mentoring"
                ]
                [ markedString "Coded manufacturing subsystems in `C#`"
                , markedString "Built a hybrid `HTML5 / C#` desktop app"
                , markedString "Investigated bugs using `SQL` and `Excel`"
                , markedString "Negotiated and documented requirements"
                , markedString "Coordinated team’s development cycles"
                , markedString "Led key improvements in team processes"
                , markedString "Mentored team members"
                ]
                (markedString "An intro")
                [ markedString "A point"
                , markedString "A point"
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
                (markedString "An intro")
                [ markedString "A point"
                , markedString "A point"
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
                (markedString "An intro")
                [ markedString "A point"
                , markedString "A point"
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
                (markedString "An intro")
                [ markedString "A point"
                , markedString "A point"
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
        "These are the teams that I’ve learned from and contributed to:"
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
