module LazyHtml
    exposing
        ( LazyHtml
        , fromLazyHtml2
        , toLazyHtml
        )

import Html as UnstyledHtml
import Html.Styled exposing (Html, toUnstyled)
import Html.Styled.Lazy exposing (lazy, lazy2)


type alias LazyHtml msg =
    UnstyledHtml.Html msg


toLazyHtml : Html msg -> LazyHtml msg
toLazyHtml =
    toUnstyled


fromLazyHtml2 : (a -> b -> LazyHtml msg) -> a -> b -> Html msg
fromLazyHtml2 =
    lazy2
