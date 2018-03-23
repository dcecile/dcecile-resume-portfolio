module Msg
    exposing
        ( Msg(DetailsClose, DetailsNavLink, DetailsOpen, NoMsg, Print)
        , clickDetailsOpen
        )

import ClickInfo exposing (ClickInfo)
import Mouse exposing (Event)


type Msg
    = Print
    | DetailsOpen String ClickInfo
    | DetailsNavLink String
    | DetailsClose
    | NoMsg


clickDetailsOpen : { a | name : String } -> Event -> Msg
clickDetailsOpen item event =
    DetailsOpen
        item.name
        { pagePos = event.pagePos
        , clientPos = event.clientPos
        }
