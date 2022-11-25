module ListEx exposing (find)


find : (a -> Bool) -> List a -> Maybe a
find condition =
    findMap
        (\item ->
            if condition item then
                Just item

            else
                Nothing
        )


findMap : (a -> Maybe b) -> List a -> Maybe b
findMap conditionTransform list =
    case list of
        head :: rest ->
            case conditionTransform head of
                Just result ->
                    Just result

                Nothing ->
                    findMap conditionTransform rest

        [] ->
            Nothing
