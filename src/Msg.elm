module Msg
    exposing
        ( Msg(DetailsClose, DetailsOpen, Print)
        , clickDetailsOpen
        )

import ClickInfo exposing (ClickInfo)
import Mouse exposing (Event)


type Msg
    = Print
    | DetailsOpen String ClickInfo
    | DetailsClose


clickDetailsOpen : String -> Event -> Msg
clickDetailsOpen name event =
    DetailsOpen
        name
        { pagePos = event.pagePos
        , clientPos = event.clientPos
        }
