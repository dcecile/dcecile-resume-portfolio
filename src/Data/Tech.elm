module Data.Tech
    exposing
        ( TechData
        , initTechData
        )

import Data.Section exposing (SectionData)


type alias TechData =
    SectionData
        { items : List String
        }


initTechData : TechData
initTechData =
    { id = "tech"
    , name = "Tech fluency"
    , iconBackground = .box
    , intro =
        "I’m always looking for new opportunities to learn, so my list of productive-use technologies keeps growing:"
    , items =
        [ "Bootstrap"
        , "C"
        , "C++"
        , "C#"
        , "CSS3"
        , "Elm"
        , "ES6"
        , "Excel"
        , "FP"
        , "functional animation"
        , "GAE"
        , "Go"
        , "Heroku"
        , "HTML5"
        , "Java"
        , "JavaScript"
        , "Lua"
        , "Python"
        , "Qt"
        , "React"
        , "responsive design"
        , "Ruby"
        , "Rails"
        , "Sass"
        , "SQL"
        , "SVG"
        , "Scala"
        , "Scheme"
        , "Unicode"
        , "Vue.js"
        , "WinForms"
        ]
    , outro =
        Just "Part of your tech stack not listed? Great! I’m confident in my ability to pick new things up quickly."
    }
