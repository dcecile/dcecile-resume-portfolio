module Display.Details
    exposing
        ( DetailsAnimation(DetailsAnimationClose, DetailsAnimationOpen)
        , DetailsDisplay
        )

import ClickInfo exposing (ClickInfo)
import Data.Details exposing (DetailsItemData)


type alias DetailsDisplay =
    { itemData : DetailsItemData
    , animation : DetailsAnimation
    , openClickInfo : ClickInfo
    }


type DetailsAnimation
    = DetailsAnimationOpen
    | DetailsAnimationClose
