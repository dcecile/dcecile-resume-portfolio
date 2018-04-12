module Flags
    exposing
        ( Flags
        )

import Favicon exposing (FaviconSource)
import Icon exposing (IconSource)


type alias Flags =
    { faviconSource : FaviconSource
    , hash : String
    , iconSource : IconSource
    }
