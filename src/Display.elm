module Display exposing
    ( Display
    , initDisplay
    )

import Data exposing (Data)
import Data.Details exposing (DetailsItemData, allDetailsItems)
import Display.Details exposing (DetailsDisplay)
import Flags exposing (Flags)


type alias Display =
    { showResumePreview : Bool
    , detailsItems : List DetailsItemData
    , details : Maybe DetailsDisplay
    }


initDisplay : Flags -> Data -> Display
initDisplay flags data =
    { showResumePreview = flags.hash == "resume"
    , detailsItems = allDetailsItems data
    , details = Nothing
    }
