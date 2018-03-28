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
        "I see software as including more than just code, and I use all of these mindsets as I work:"
    , items =
        [ MindsetsItemData
            "making"
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
        , MindsetsItemData
            "learning"
            (markedString "There’s always something new to learn, some deeper understanding to be gained, some path to grow my skills.")
            [ markedString "At `Unitron`, I learned the ins and outs of numerous internal business and software systems, helping me make my team’s solutions more robust"
            , markedString "In `Forks in the Road`, I learned how to use JWT authentication for a API-only `Rails` app"
            , markedString "In `Off-Grid Orcs`, I learned how to apply a `functional programming` architecture to a highly-interactive application"
            ]
        , MindsetsItemData
            "teaching"
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
        , MindsetsItemData
            "analyzing"
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
        , MindsetsItemData
            "coordinating"
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
        , MindsetsItemData
            "improving"
            (markedString "An intro")
            [ markedString "A point"
            , markedString "A point"
            ]
        ]
    , outro = Nothing
    }
