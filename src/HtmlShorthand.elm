module HtmlShorthand
    exposing
        ( HtmlTag
        , ariaLabel
        , hrefHash
        , onClickPreventDefault
        , targetBlank
        )

import Html.Styled exposing (Attribute, Html)
import Html.Styled.Attributes exposing (attribute, href, target)
import Html.Styled.Events exposing (defaultOptions, onWithOptions)
import Json.Decode as Json


type alias HtmlTag msg =
    List (Attribute msg) -> List (Html msg) -> Html msg


ariaLabel : String -> Attribute msg
ariaLabel =
    attribute "aria-label"


hrefHash : Attribute msg
hrefHash =
    href "#"


onClickPreventDefault : msg -> Attribute msg
onClickPreventDefault msg =
    onWithOptions
        "click"
        { defaultOptions | preventDefault = True }
        (Json.succeed msg)


targetBlank : Attribute msg
targetBlank =
    target "_blank"
