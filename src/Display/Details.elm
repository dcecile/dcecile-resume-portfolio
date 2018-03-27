module Display.Details
    exposing
        ( DetailsAnimation(DetailsAnimationClose, DetailsAnimationNavigate, DetailsAnimationOpen)
        , DetailsDisplay
        , DetailsDoubleBufferState(DetailsDoubleBufferFirstSlotNew, DetailsDoubleBufferFirstSlotOld)
        , DetailsNavigateDirection(DetailsNavigateLink, DetailsNavigateNext, DetailsNavigatePrevious)
        , initDoubleBuffer
        , swapDoubleBuffer
        )

import ClickInfo exposing (ClickInfo)
import Data.Details exposing (DetailsItemData)


type alias DetailsDisplay =
    { itemData : DetailsItemData
    , animation : DetailsAnimation
    , openClickInfo : ClickInfo
    , doubleBufferState : DetailsDoubleBufferState
    }


type DetailsAnimation
    = DetailsAnimationOpen
    | DetailsAnimationClose
    | DetailsAnimationNavigate { direction : DetailsNavigateDirection, oldItemData : DetailsItemData }


type DetailsNavigateDirection
    = DetailsNavigatePrevious
    | DetailsNavigateNext
    | DetailsNavigateLink


type DetailsDoubleBufferState
    = DetailsDoubleBufferFirstSlotNew
    | DetailsDoubleBufferFirstSlotOld


initDoubleBuffer : DetailsDoubleBufferState
initDoubleBuffer =
    DetailsDoubleBufferFirstSlotNew


swapDoubleBuffer : DetailsDisplay -> DetailsDoubleBufferState
swapDoubleBuffer details =
    case details.doubleBufferState of
        DetailsDoubleBufferFirstSlotNew ->
            DetailsDoubleBufferFirstSlotOld

        DetailsDoubleBufferFirstSlotOld ->
            DetailsDoubleBufferFirstSlotNew
