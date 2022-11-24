module Model exposing
    ( Model
    , init
    )

import Assets exposing (Assets, initAssets)
import Data exposing (Data)
import Display exposing (Display, initDisplay)
import Flags exposing (Flags)
import Msg exposing (Msg)
import Navigation exposing (initScroll)


type alias Model =
    { assets : Assets
    , display : Display
    }


init : Data -> Flags -> ( Model, Cmd Msg )
init data flags =
    ( initModel data flags, initCmd )


initModel : Data -> Flags -> Model
initModel data flags =
    { assets = initAssets flags
    , display = initDisplay flags data
    }


initCmd : Cmd Msg
initCmd =
    initScroll ()
