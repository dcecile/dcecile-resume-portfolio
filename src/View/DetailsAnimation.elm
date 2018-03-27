module View.DetailsAnimation
    exposing
        ( animateDetails
        , animateDetailsItem
        , animatePortfolio
        )

import ClickInfo exposing (ClickInfo)
import Css exposing (Style, batch)
import CssShorthand exposing (animation, mediaNotPrint, noStyle, transformOrigin, willChangeTransform)
import Display.Details exposing (DetailsAnimation(DetailsAnimationClose, DetailsAnimationNavigate, DetailsAnimationOpen))
import Model exposing (Model)


animatePortfolio : Model -> Style
animatePortfolio model =
    animate model (.pagePos >> Just) <|
        \animation ->
            case animation of
                DetailsAnimationClose ->
                    combine [ "fadeIn", "zoomOut" ] False

                _ ->
                    combine [ "fadeOut", "zoomIn" ] True


animateDetails : Model -> Style
animateDetails model =
    animate model (.clientPos >> Just) <|
        \animation ->
            case animation of
                DetailsAnimationClose ->
                    combine [ "fadeOut", "growOut" ] True

                _ ->
                    combine [ "fadeIn", "growIn" ] False


animateDetailsItem : Bool -> Model -> Style
animateDetailsItem isNew model =
    animate model (always Nothing) <|
        \animation ->
            case ( isNew, animation ) of
                ( True, DetailsAnimationNavigate _ ) ->
                    combine [ "fadeIn", "growIn" ] True

                ( False, DetailsAnimationNavigate _ ) ->
                    combine [ "fadeOut", "growOut" ] True

                _ ->
                    ""


animate : Model -> (ClickInfo -> Maybe ( Float, Float )) -> (DetailsAnimation -> String) -> Style
animate model originSelector animationValue =
    let
        originStyle ( x, y ) =
            transformOrigin <|
                toString x
                    ++ "px "
                    ++ toString y
                    ++ "px"
    in
    case model.details of
        Nothing ->
            noStyle

        Just details ->
            batch
                [ animation (animationValue details.animation)
                , originSelector details.openClickInfo
                    |> Maybe.map originStyle
                    |> Maybe.withDefault noStyle
                ]


combine : List String -> Bool -> String
combine animationNames first =
    let
        fullDuration =
            250

        overlap =
            0.4

        duration =
            (fullDuration * (1 + overlap)) / 2

        delay =
            if first then
                0
            else
                fullDuration - duration
    in
    animationNames
        |> List.map
            (\animationName ->
                String.join " "
                    [ animationName
                    , toString duration ++ "ms"
                    , toString delay ++ "ms"
                    , "both"
                    , if first then
                        "ease-out"
                      else
                        "ease-in"
                    ]
            )
        |> String.join ", "
