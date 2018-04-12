module View.DetailsAnimation
    exposing
        ( animateDetails
        , animateDetailsItem
        , animatePortfolio
        )

import Css exposing (Style, batch)
import CssShorthand exposing (animation, mediaNotPrint, noStyle, transformOrigin, willChangeTransform)
import Display exposing (Display)
import Display.Details exposing (DetailsAnimation(DetailsAnimationClose, DetailsAnimationNavigate, DetailsAnimationOpen), DetailsDisplay, DetailsNavigateDirection(DetailsNavigateLink, DetailsNavigateNext, DetailsNavigatePrevious))


type OpenOrClose
    = Open
    | Close


type PortfolioOrDetails
    = Portfolio
    | Details


type NewOrOld
    = New
    | Old


animatePortfolio : Display -> Style
animatePortfolio display =
    case display.details of
        Just details ->
            animateProtfolioAndDetails Portfolio details
                |> Maybe.withDefault noStyle

        Nothing ->
            animation <|
                String.join " "
                    [ "fadeIn"
                    , "800ms"
                    , "ease-out"
                    ]


animateDetails : DetailsDisplay -> Style
animateDetails details =
    details
        |> animateProtfolioAndDetails Details
        |> Maybe.withDefault noStyle


animateProtfolioAndDetails : PortfolioOrDetails -> DetailsDisplay -> Maybe Style
animateProtfolioAndDetails portfolioOrDetails details =
    let
        openOrClose =
            case details.animation of
                DetailsAnimationClose ->
                    Close

                _ ->
                    Open

        originStyle ( x, y ) =
            transformOrigin <|
                toString x
                    ++ "px "
                    ++ toString y
                    ++ "px"

        origin =
            case portfolioOrDetails of
                Portfolio ->
                    originStyle details.openClickInfo.pagePos

                Details ->
                    originStyle details.openClickInfo.clientPos

        fullDuration =
            250

        overlap =
            0.6

        duration =
            (fullDuration * (1 + overlap)) / 2

        delay newOrOld =
            case newOrOld of
                New ->
                    fullDuration - duration

                Old ->
                    0

        easing newOrOld =
            case newOrOld of
                New ->
                    "ease-out"

                Old ->
                    "ease-in"

        animate animationNames newOrOld =
            combineAnimations
                animationNames
                duration
                (delay newOrOld)
                (easing newOrOld)

        switch =
            case ( openOrClose, portfolioOrDetails ) of
                ( Open, Portfolio ) ->
                    animate [ "fadeOut", "zoomIn" ] Old

                ( Open, Details ) ->
                    animate [ "fadePartialIn", "growIn" ] New

                ( Close, Portfolio ) ->
                    animate [ "fadeIn", "zoomOut" ] New

                ( Close, Details ) ->
                    animate [ "fadePartialOut", "growOut" ] Old
    in
    (Just << batch)
        [ switch
        , origin
        ]


animateDetailsItem : Bool -> DetailsDisplay -> Style
animateDetailsItem isNew details =
    let
        maybeDirection =
            case details.animation of
                DetailsAnimationNavigate { direction } ->
                    Just direction

                _ ->
                    Nothing

        newOrOld =
            if isNew then
                New
            else
                Old

        animateSlow =
            animate 250

        animateFast =
            animate 200

        animate duration animationNames =
            combineAnimations
                animationNames
                duration
                0
                "ease"

        switch direction =
            case ( direction, newOrOld ) of
                ( DetailsNavigatePrevious, Old ) ->
                    animateSlow [ "fadePartialOut", "toRight" ]

                ( DetailsNavigatePrevious, New ) ->
                    animateSlow [ "fadePartialIn", "fromLeft" ]

                ( DetailsNavigateNext, Old ) ->
                    animateSlow [ "fadePartialOut", "toLeft" ]

                ( DetailsNavigateNext, New ) ->
                    animateSlow [ "fadePartialIn", "fromRight" ]

                ( DetailsNavigateLink, Old ) ->
                    animateFast [ "fadePartialOut", "growOut" ]

                ( DetailsNavigateLink, New ) ->
                    animateFast [ "fadePartialIn", "fromBottom" ]
    in
    maybeDirection
        |> Maybe.map switch
        |> Maybe.withDefault noStyle


combineAnimations : List String -> Float -> Float -> String -> Style
combineAnimations animationNames duration delay easing =
    animationNames
        |> List.map
            (\animationName ->
                String.join " "
                    [ animationName
                    , toString duration ++ "ms"
                    , toString delay ++ "ms"
                    , "both"
                    , easing
                    ]
            )
        |> String.join ", "
        |> animation
