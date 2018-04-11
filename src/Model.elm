module Model
    exposing
        ( Flags
        , Model
        , init
        )

import Data exposing (Data, initData)
import Data.Details exposing (DetailsItemData, allDetailsItems)
import Display.Details exposing (DetailsDisplay)
import Favicon exposing (FaviconSource)
import Icon exposing (IconSource)
import Msg exposing (Msg)
import Navigation exposing (initScroll)


type alias Flags =
    { faviconSource : FaviconSource
    , hash : String
    , iconSource : IconSource
    }


type alias Model =
    { data : Data
    , allDetailsItems : List DetailsItemData
    , faviconSource : FaviconSource
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
    , faviconSource = flags.faviconSource
    , iconSource = flags.iconSource
    , resumeDisplay = flags.hash == "resume"
    , details = Nothing
    }


initCmd : Cmd Msg
initCmd =
    initScroll ()
