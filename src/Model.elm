module Model
    exposing
        ( Model
        , init
        )

import Assets exposing (Assets, initAssets)
import Data exposing (Data, initData)
import Display exposing (Display, initDisplay)
import Flags exposing (Flags)
import Msg exposing (Msg)
import Navigation exposing (initScroll)


type alias Model =
    { assets : Assets
    , data : Data
    , display : Display
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( initModel flags, initCmd )


initModel : Flags -> Model
initModel flags =
    let
        data =
            initData
    in
    { assets = initAssets flags
    , data = data
    , display = initDisplay flags data
    }


initCmd : Cmd Msg
initCmd =
    initScroll ()
