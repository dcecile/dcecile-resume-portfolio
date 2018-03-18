module Msg
    exposing
        ( Msg(DetailsClose, DetailsOpen, NoMsg, Print)
        , clickDetailsOpen
        )

import ClickInfo exposing (ClickInfo)
import Data.Details exposing (DetailsItemData, DetailsItemDataInput, detailsItemData)
import Mouse exposing (Event)


type Msg
    = Print
    | DetailsOpen DetailsItemData ClickInfo
    | DetailsClose
    | NoMsg


clickDetailsOpen : DetailsItemDataInput a -> Event -> Msg
clickDetailsOpen item event =
    DetailsOpen
        (detailsItemData item)
        { pagePos = event.pagePos
        , clientPos = event.clientPos
        }
