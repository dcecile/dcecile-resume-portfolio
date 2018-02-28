module Data.Resume
    exposing
        ( ResumeData
        , initResumeData
        )


type alias ResumeData =
    { homepageURL : String
    , tagline : String
    , sourceShortURL : Maybe String
    }


initResumeData : ResumeData
initResumeData =
    { homepageURL = "https://dcecile.github.io"
    , tagline = "Software developer, 10 years experience"
    , sourceShortURL = Just "https://git.io/dcecile-resume"
    }
