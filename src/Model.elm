module Model
    exposing
        ( Flags
        , Model
        , init
        )

import Data exposing (Data, initData)
import Icon exposing (IconSource)
import Msg exposing (Msg)
import Scroll exposing (initScroll)


type alias Flags =
    { iconSource : IconSource
    }


type alias Model =
    { data : Data
    , iconSource : IconSource
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( initModel flags, initCmd )


initModel : Flags -> Model
initModel flags =
    { data = initData
    , iconSource = flags.iconSource
    }


initCmd : Cmd Msg
initCmd =
    initScroll ()
