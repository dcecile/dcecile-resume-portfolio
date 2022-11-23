module LazyHtml exposing
    ( LazyHtml
    , fromLazyHtml2
    , toLazyHtml
    )

import Html.Styled exposing (Html)
import Html.Styled.Lazy exposing (lazy2)


type alias LazyHtml msg =
    Html msg


toLazyHtml : Html msg -> Html msg
toLazyHtml html =
    html


fromLazyHtml2 : (a -> b -> Html msg) -> a -> b -> Html msg
fromLazyHtml2 =
    lazy2
