module Data.Work
    exposing
        ( WorkData
        , WorkItemData
        , initWorkData
        )

import Data.Section exposing (SectionData)
import Icon exposing (calendarBackground)


type alias WorkData =
    SectionData
        { largeItems : List WorkItemData
        , smallItems : List WorkItemData
        }


type alias WorkItemData =
    { name : String
    , duration : String
    , titles : List String
    , skills : List String
    }


initWorkData : WorkData
initWorkData =
    { id = "work"
    , name = "Work history"
    , iconBackground = calendarBackground
    , intro =
        "I’ve got 10 years of experience writing software, and I’m looking to add the name of a new team to this list:"
    , largeItems =
        [ WorkItemData
            "Unitron"
            "8 years"
            [ "Software Developer"
            , "Senior Software Developer"
            ]
            [ "C# / .NET / WinForms /"
            , "SQL / data analysis /"
            , "requirements gathering /"
            , "mentoring"
            ]
        ]
    , smallItems =
        [ WorkItemData
            "NexJ"
            "8 months"
            [ "co-op"
            ]
            [ "Java / Scheme"
            ]
        , WorkItemData
            "Coreworx"
            "8 months"
            [ "co-op"
            ]
            [ "C# / SQL"
            ]
        , WorkItemData
            "LSI Logic"
            "8 months"
            [ "co-op"
            ]
            [ "C / C++"
            ]
        ]
    , outro =
        Just "Think my skills would be a good fit for your team? Let me know!"
    }
