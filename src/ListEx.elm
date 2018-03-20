module ListEx
    exposing
        ( find
        , mapFirst
        )


find : (a -> Bool) -> List a -> Maybe a
find condition list =
    case list of
        head :: rest ->
            if condition head then
                Just head
            else
                find condition rest

        [] ->
            Nothing


mapFirst : (a -> Maybe b) -> List a -> Maybe b
mapFirst transform list =
    case list of
        head :: rest ->
            case transform head of
                Just result ->
                    Just result

                Nothing ->
                    mapFirst transform rest

        [] ->
            Nothing
