module HtmlShorthand exposing
    ( HtmlTag
    , ariaLabel
    , hrefHash
    , onClickPreventDefault
    , styledSpanText
    , targetBlank
    )

import Css exposing (Style)
import Html.Styled exposing (Attribute, Html, span, styled, text)
import Html.Styled.Attributes exposing (attribute, fromUnstyled, href, target)
import Html.Styled.Events exposing (defaultOptions)
import Mouse exposing (Event, onWithOptions)


type alias HtmlTag msg =
    List (Attribute msg) -> List (Html msg) -> Html msg


ariaLabel : String -> Attribute msg
ariaLabel =
    attribute "aria-label"


hrefHash : Attribute msg
hrefHash =
    href "#"


onClickPreventDefault : (Event -> msg) -> Attribute msg
onClickPreventDefault handler =
    fromUnstyled <|
        onWithOptions
            "click"
            { defaultOptions | preventDefault = True }
            handler


styledSpanText : List Style -> String -> Html msg
styledSpanText styles string =
    styled span styles [] [ text string ]


targetBlank : Attribute msg
targetBlank =
    target "_blank"
