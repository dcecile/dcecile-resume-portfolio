module Assets exposing
    ( Assets
    , initAssets
    )

import Favicon exposing (FaviconSource)
import Flags exposing (Flags)
import Icon exposing (IconSource)


type alias Assets =
    { faviconSource : FaviconSource
    , iconSource : IconSource
    }


initAssets : Flags -> Assets
initAssets flags =
    { faviconSource = flags.faviconSource
    , iconSource = flags.iconSource
    }
