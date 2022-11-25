module Msg exposing
    ( Msg(..)
    , clickDetailsOpen
    )

import ClickInfo exposing (ClickInfo)
import Display.Details exposing (DetailsNavigateDirection)
import Html.Events.Extra.Mouse exposing (Event)


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
