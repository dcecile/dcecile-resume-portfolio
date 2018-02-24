module Data.Work
    exposing
        ( WorkData
        , initWorkData
        )

import Data.Section exposing (SectionData)
import Icon exposing (calendarBackground)


type alias WorkData =
    SectionData


initWorkData : WorkData
initWorkData =
    { id = "work"
    , name = "Work history"
    , iconBackground = calendarBackground
    }
