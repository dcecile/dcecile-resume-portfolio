port module Navigation
    exposing
        ( initScroll
        , onHashChange
        )


port initScroll : () -> Cmd msg


port onHashChange : (String -> msg) -> Sub msg
