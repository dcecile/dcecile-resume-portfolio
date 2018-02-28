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
    }


initLinksData : LinksData
initLinksData =
    let
        github =
            LinksItemData
                "GitHub"
                .github
                "https://github.com/dcecile"

        linkedin =
            LinksItemData
                "LinkedIn"
                .linkedin
                "https://www.linkedin.com/in/dancecile"

        stackOverflow =
            LinksItemData
                "Stack Overflow"
                .stackOverflow
                "https://stackoverflow.com/users/207321/dan-cecile?tab=profile"

        twitter =
            LinksItemData
                "Twitter"
                .twitter
                "https://twitter.com/dancecile"

        fiveHundredPx =
            LinksItemData
                "500px"
                .fiveHundredPx
                "https://500px.com/dancecile"
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
