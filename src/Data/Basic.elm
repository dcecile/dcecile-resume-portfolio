module Data.Basic exposing
    ( BasicData
    , homepageURL
    , initBasicData
    , sourceURL
    )

import MarkedString exposing (MarkedString, markedString)


type alias BasicData =
    { name : String
    , pronouns : String
    , emailAddress : String
    , currentLocation : String
    , homepageURL : String
    , tagline : String
    , portfolioIntroPoints : List String
    , resumeIntro : MarkedString
    , sourceURL : String
    , sourceShortURL : Maybe String
    }


homepageURL : String
homepageURL =
    "https://dcecile.github.io"


sourceURL : String
sourceURL =
    "https://github.com/dcecile/dcecile-resume-portfolio"


initBasicData : BasicData
initBasicData =
    { name = "Dan Cecile"
    , pronouns = "he/him"
    , emailAddress = "dancecile@gmail.com"
    , currentLocation = "Canada (remote, EST)"
    , homepageURL = homepageURL
    , tagline = "Senior Full-Stack Software Engineer"
    , portfolioIntroPoints =
        [ "I have more than 14 years of experience making high quality software. This includes expertise in a wide variety of technologies, but I’m always open to learning new programming languages, frameworks, and services. And regardless of the tech stack, I see deep value in software engineering best practices and effective communication."
        , "In my projects, I take ambiguous problem definitions, and work with stakeholders to develop innovative and practical solutions. It’s an iterative process that includes structured brainstorming, successive refinement, frequent releases, and regular check-ins. For quality control along the way, I take advantage of continuous integration, code reviews, unit tests, and static analysis. By the time I’m done, I am proud of my work and stakeholders are confident that the problem is solved."
        , "I look forward to the opportunity to learn, to improve my skills, and to bring positive customer impact. I am committed to mentoring and helping out wherever I can, so that as a team we can grow together and ship some great software."
        , "Outside of work, I find my bliss spending time with my family, lost in library book stacks, and skating the city on my rollerblades."
        ]
    , resumeIntro =
        markedString "With `14+ years of experience` making high quality software, you can count on me for tech expertise, best practices, and effective communication."
    , sourceURL = sourceURL
    , sourceShortURL = Just "https://git.io/dcecile-resume"
    }
