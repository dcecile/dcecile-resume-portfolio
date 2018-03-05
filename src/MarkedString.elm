module MarkedString
    exposing
        ( MarkedString
        , MarkedSubstring(NormalSubstring, SpecialSubstring)
        , markedString
        , transform
        )


type alias MarkedString =
    List MarkedSubstring


type MarkedSubstring
    = NormalSubstring String
    | SpecialSubstring String


markedString : String -> MarkedString
markedString =
    let
        loop index =
            if index % 2 == 0 then
                NormalSubstring
            else
                SpecialSubstring
    in
    String.split "`"
        >> List.indexedMap loop


transform : (String -> a) -> (String -> a) -> MarkedString -> List a
transform normal special =
    let
        loop substring =
            case substring of
                NormalSubstring substring ->
                    normal substring

                SpecialSubstring substring ->
                    special substring
    in
    List.map loop
