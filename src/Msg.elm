module Msg
    exposing
        ( Msg(DetailsClose, DetailsOpen, NoMsg, Print)
        , clickDetailsOpen
        , clickDetailsOpenWithUrl
        )

import ClickInfo exposing (ClickInfo)
import Data.Details exposing (DetailsItemData, DetailsItemDataInput, DetailsItemDataInputUrl, detailsItemData)
import Mouse exposing (Event)


type Msg
    = Print
    | DetailsOpen DetailsItemData ClickInfo
    | DetailsClose
    | NoMsg


clickDetailsOpen : DetailsItemDataInput a -> Event -> Msg
clickDetailsOpen =
    clickDetailsOpenMaybeWithUrl (always Nothing)


clickDetailsOpenWithUrl : DetailsItemDataInput (DetailsItemDataInputUrl a) -> Event -> Msg
clickDetailsOpenWithUrl =
    clickDetailsOpenMaybeWithUrl Just


clickDetailsOpenMaybeWithUrl : (DetailsItemDataInput a -> Maybe (DetailsItemDataInputUrl b)) -> DetailsItemDataInput a -> Event -> Msg
clickDetailsOpenMaybeWithUrl itemUrlSelector item event =
    DetailsOpen
        (detailsItemData item (itemUrlSelector item))
        { pagePos = event.pagePos
        , clientPos = event.clientPos
        }
