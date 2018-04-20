module Data.Visibility
    exposing
        ( ResumeVariant(ElmResume, GeneralResume, GoResume)
        , Visibility
        , filterResumeVisible
        , portfolioAndResume
        , portfolioOnly
        )


type alias Visibility =
    List ResumeVariant


type ResumeVariant
    = GeneralResume
    | ElmResume
    | GoResume


portfolioOnly : Visibility
portfolioOnly =
    []


portfolioAndResume : List ResumeVariant -> Visibility
portfolioAndResume =
    identity


filterResumeVisible : ResumeVariant -> (a -> Visibility) -> List a -> List a
filterResumeVisible resumeVariant =
    filterVisible (List.member resumeVariant)


filterVisible : (Visibility -> Bool) -> (a -> Visibility) -> List a -> List a
filterVisible test selector =
    List.filter (selector >> test)
