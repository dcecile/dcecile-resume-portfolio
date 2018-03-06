module Msg
    exposing
        ( Msg(DetailsClose, DetailsOpen, Print)
        , clickDetailsOpen
        )

import ClickInfo exposing (ClickInfo)
import Mouse exposing (Event)


type Msg
    = Print
    | DetailsOpen ClickInfo
    | DetailsClose


clickDetailsOpen : Event -> Msg
clickDetailsOpen event =
    DetailsOpen
        { pagePos = event.pagePos
        , clientPos = event.clientPos
        }
