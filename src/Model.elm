module Model
    exposing
        ( Flags
        , Model
        , init
        )

import Data exposing (Data, initData)
import Data.Details exposing (DetailsItemData, allDetailsItems)
import Display.Details exposing (DetailsDisplay)
import Icon exposing (IconSource)
import Msg exposing (Msg)
import Scroll exposing (initScroll)


type alias Flags =
    { iconSource : IconSource
    , resumeDisplay : Bool
    }


type alias Model =
    { data : Data
    , allDetailsItems : List DetailsItemData
    , iconSource : IconSource
    , resumeDisplay : Bool
    , details : Maybe DetailsDisplay
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( initModel flags, initCmd )


initModel : Flags -> Model
initModel flags =
    { data = initData
    , allDetailsItems = allDetailsItems initData
    , iconSource = flags.iconSource
    , resumeDisplay = flags.resumeDisplay
    , details = Nothing
    }


initCmd : Cmd Msg
initCmd =
    initScroll ()
