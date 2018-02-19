module HtmlShorthand
    exposing
        ( HtmlTag
        , hrefHash
        , onClickPreventDefault
        , targetBlank
        )

import Html.Styled exposing (Attribute, Html)
import Html.Styled.Attributes exposing (href, target)
import Html.Styled.Events exposing (defaultOptions, onWithOptions)
import Json.Decode as Json


type alias HtmlTag msg =
    List (Attribute msg) -> List (Html msg) -> Html msg


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
