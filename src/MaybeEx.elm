module MaybeEx
    exposing
        ( toList
        )


toList : Maybe a -> List a
toList =
    Maybe.map List.singleton
        >> Maybe.withDefault []
