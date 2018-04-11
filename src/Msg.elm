module Msg
    exposing
        ( Msg(DetailsClose, DetailsNavigate, DetailsOpen, HashChange, NoMsg, Print)
        , clickDetailsOpen
        )

import ClickInfo exposing (ClickInfo)
import Display.Details exposing (DetailsNavigateDirection)
import Mouse exposing (Event)


type Msg
    = HashChange String
    | Print
    | DetailsOpen String ClickInfo
    | DetailsNavigate DetailsNavigateDirection String
    | DetailsClose
    | NoMsg


clickDetailsOpen : { a | name : String } -> Event -> Msg
clickDetailsOpen item event =
    DetailsOpen
        item.name
        { pagePos = event.pagePos
        , clientPos = event.clientPos
        }
