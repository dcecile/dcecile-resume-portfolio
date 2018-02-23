module Model
    exposing
        ( Flags
        , Model
        , init
        )

import Icon exposing (IconSource)
import Msg exposing (Msg)
import Scroll exposing (initScroll)


type alias Flags =
    { iconSource : IconSource
    }


type alias Model =
    { iconSource : IconSource
    }


init : Flags -> ( Model, Cmd Msg )
init flags =
    ( flags, initScroll () )
