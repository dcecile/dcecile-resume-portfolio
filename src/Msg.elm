module Msg
    exposing
        ( Msg(DetailsClose, DetailsNavLink, DetailsOpen, NoMsg, Print)
        , clickDetailsOpen
        , clickDetailsOpenWithUrl
        )

import ClickInfo exposing (ClickInfo)
import Data.Details exposing (DetailsItemData, DetailsItemDataInput, DetailsItemDataInputUrl, detailsItemData, detailsItemDataWithUrl)
import Mouse exposing (Event)


type Msg
    = Print
    | DetailsOpen DetailsItemData ClickInfo
    | DetailsNavLink String
    | DetailsClose
    | NoMsg


clickDetailsOpen : DetailsItemDataInput a -> Event -> Msg
clickDetailsOpen =
    clickDetailsOpenMaybeWithUrl detailsItemData


clickDetailsOpenWithUrl : DetailsItemDataInput (DetailsItemDataInputUrl a) -> Event -> Msg
clickDetailsOpenWithUrl =
    clickDetailsOpenMaybeWithUrl detailsItemDataWithUrl


clickDetailsOpenMaybeWithUrl : (a -> DetailsItemData) -> a -> Event -> Msg
clickDetailsOpenMaybeWithUrl detailsConverter item event =
    DetailsOpen
        (detailsConverter item)
        { pagePos = event.pagePos
        , clientPos = event.clientPos
        }
