module Data.Work
    exposing
        ( WorkData
        , WorkItemData
        , initWorkData
        )

import Data.Section exposing (SectionData)


type alias WorkData =
    SectionData
        { portfolioLargeItems : List WorkItemData
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
    , resumePoints : List String
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
                [ "C# / .NET / WinForms /"
                , "SQL / data analysis /"
                , "requirements gathering /"
                , "mentoring"
                ]
                [ "Implemented manufacturing tests in C#"
                , "Investigated bugs using SQL and Excel"
                , "Led improvements in team processes"
                , "Gathered and negotiated requirements"
                , "Mentored team members"
                ]

        nexj =
            WorkItemData
                "NexJ"
                "Toronto, Ontario"
                "8 months"
                [ "co-op"
                ]
                [ ( "Developer", "2008 winter co-op" )
                , ( "Application Developer", "2008 fall co-op" )
                ]
                [ "Java / Scheme"
                ]
                [ "Integrated Ant/WiX installer using Java"
                , "Wrote tests, fixed CRM bugs in Scheme"
                ]

        coreworx =
            WorkItemData
                "Coreworx"
                "Kitchener, Ontario"
                "8 months"
                [ "co-op"
                ]
                [ ( "Software Developer", "2006/2007 co-op" )
                ]
                [ "C# / SQL"
                ]
                [ "Implemented DMS personalization in C#"
                , "Automated Oracle DB migration in SQL"
                ]

        lsi =
            WorkItemData
                "LSI Logic"
                "Waterloo, Ontario"
                "8 months"
                [ "co-op"
                ]
                [ ( "Software Engineer", "2005/2006 co-op" )
                ]
                [ "C / C++"
                ]
                [ "Fixed H.264 video decoder bugs in C"
                , "Created performance analyis tool in C++"
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
                [ "Helping lead maker workshops"
                , "Teaching kids STEAM mindsets"
                ]
    in
    { id = "work"
    , name = "Work history"
    , iconBackground = .calendar
    , intro =
        "I’ve got 10 years of experience writing software, and I’m looking to add the name of a new team to this list:"
    , portfolioLargeItems =
        [ unitron
        ]
    , portfolioSmallItems =
        [ nexj
        , coreworx
        , lsi
        ]
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
        Just "Think my skills would be a good fit for your team? Let me know!"
    }
