module HtmlShorthand exposing
    ( HtmlTag
    , ariaLabel
    , hrefHash
    , onClickPreventDefault
    , styledSpanText
    , targetBlank
    )

import Css exposing (Style)
import Html.Events.Extra.Mouse exposing (Event, onWithOptions)
import Html.Styled exposing (Attribute, Html, span, styled, text)
import Html.Styled.Attributes exposing (attribute, fromUnstyled, href, target)


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
            { stopPropagation = False, preventDefault = True }
            handler


styledSpanText : List Style -> String -> Html msg
styledSpanText styles string =
    styled span styles [] [ text string ]


targetBlank : Attribute msg
targetBlank =
    target "_blank"
