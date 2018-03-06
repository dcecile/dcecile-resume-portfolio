module View.DetailsAnimation
    exposing
        ( animateDetails
        , animatePortfolio
        )

import ClickInfo exposing (ClickInfo)
import Css exposing (Style, batch)
import CssShorthand exposing (animation, mediaNotPrint, noStyle, transformOrigin, willChangeTransform)
import Model exposing (Animation(AnimationClose, AnimationOpen), Model)


animatePortfolio : Model -> Style
animatePortfolio model =
    animate model .pagePos <|
        \animation ->
            case animation of
                AnimationOpen ->
                    combine [ "fadeOut", "zoomIn" ] True

                AnimationClose ->
                    combine [ "fadeIn", "zoomOut" ] False


animateDetails : Model -> Style
animateDetails model =
    animate model .clientPos <|
        \animation ->
            case animation of
                AnimationOpen ->
                    combine [ "fadePartialIn", "growIn" ] False

                AnimationClose ->
                    combine [ "fadePartialOut", "growOut" ] True


animate : Model -> (ClickInfo -> ( Float, Float )) -> (Animation -> String) -> Style
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
                , originStyle (originSelector details.clickInfo)
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
