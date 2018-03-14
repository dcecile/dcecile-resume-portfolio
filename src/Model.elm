module Model
    exposing
        ( Animation(AnimationClose, AnimationOpen)
        , Details
        , Flags
        , Model
        , init
        )

import ClickInfo exposing (ClickInfo)
import Data exposing (Data, initData)
import Icon exposing (IconSource)
import Msg exposing (Msg)
import Scroll exposing (initScroll)


type alias Flags =
    { iconSource : IconSource
    , resumeDisplay : Bool
    }


type alias Model =
    { data : Data
    , iconSource : IconSource
    , resumeDisplay : Bool
    , details : Maybe Details
    }


type alias Details =
    { name : String, animation : Animation, clickInfo : ClickInfo }


type Animation
    = AnimationOpen
    | AnimationClose


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( initModel flags, initCmd )


initModel : Flags -> Model
initModel flags =
    { data = initData
    , iconSource = flags.iconSource
    , resumeDisplay = flags.resumeDisplay
    , details = Nothing
    }


initCmd : Cmd Msg
initCmd =
    initScroll ()
