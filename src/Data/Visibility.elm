module Data.Visibility
    exposing
        ( Visibility(PortfolioAndResume, PortfolioOnly)
        , filterVisible
        )


type Visibility
    = PortfolioOnly
    | PortfolioAndResume


filterVisible : Visibility -> (a -> Visibility) -> List a -> List a
filterVisible visibility selector =
    List.filter (selector >> (==) visibility)
