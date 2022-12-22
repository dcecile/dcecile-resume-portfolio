module Data.Links exposing
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

        twitter =
            LinksItemData
                "Twitter"
                .twitter
                "https://twitter.com/dancecile"
                Nothing
    in
    { portfolioItems =
        [ github
        , linkedin
        , twitter
        ]
    , resumeItems =
        [ linkedin
        , github
        ]
    }
