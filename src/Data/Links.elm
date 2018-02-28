module Data.Links
    exposing
        ( LinksData
        , LinksItemData
        , initLinksData
        )

import Icon exposing (IconBackground)


type alias LinksData =
    { portfolioItems : List LinksItemData
    , resumeItems : List LinksItemData
    }


type alias LinksItemData =
    { name : String
    , iconBackground : IconBackground
    , url : String
    , shortURL : Maybe String
    }


initLinksData : LinksData
initLinksData =
    let
        github =
            LinksItemData
                "GitHub"
                .github
                "https://github.com/dcecile"
                Nothing

        linkedin =
            LinksItemData
                "LinkedIn"
                .linkedin
                "https://www.linkedin.com/in/dancecile/"
                (Just "https://linkedin.com/in/dancecile")

        stackOverflow =
            LinksItemData
                "Stack Overflow"
                .stackOverflow
                "https://stackoverflow.com/users/207321/dan-cecile?tab=profile"
                Nothing

        twitter =
            LinksItemData
                "Twitter"
                .twitter
                "https://twitter.com/dancecile"
                Nothing

        fiveHundredPx =
            LinksItemData
                "500px"
                .fiveHundredPx
                "https://500px.com/dancecile"
                Nothing
    in
    { portfolioItems =
        [ github
        , linkedin
        , stackOverflow
        , twitter
        , fiveHundredPx
        ]
    , resumeItems =
        [ linkedin
        , github
        ]
    }
