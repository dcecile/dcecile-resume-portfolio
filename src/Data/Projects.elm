module Data.Projects
    exposing
        ( ProjectsData
        , ProjectsItemData
        , initProjectsData
        )

import Data.Section exposing (SectionData)
import Icon exposing (heartBackground)


type alias ProjectsData =
    SectionData
        { items : List ProjectsItemData
        }


type alias ProjectsItemData =
    { name : String
    , tech : String
    , description : String
    , url : String
    }


initProjectsData : ProjectsData
initProjectsData =
    { id = "projects"
    , name = "Side projects"
    , iconBackground = heartBackground
    , intro =
        "I see software as a medium with amazing potential, and curiosity drives me to learn and create more of it:"
    , items =
        [ ProjectsItemData
            "Forks"
            "React / Rails"
            "Expected value ranking"
            "https://github.com/dcecile/forks-in-the-road"
        , ProjectsItemData
            "Tacit"
            "Scala / CSS3"
            "A programming language"
            "https://github.com/tacit-lang/tacit"
        , ProjectsItemData
            "Off-Grid Orcs"
            "Scala.js / AI"
            "64x64 pixel RTS game"
            "https://github.com/dcecile/off-grid-orcs"
        , ProjectsItemData
            "bitfontmake"
            "Python / UFO"
            "Vectorized bitmap fonts"
            "https://github.com/dcecile/bitfontmake"
        , ProjectsItemData
            "PR Quest"
            "Vue.js / Airtable"
            "SPA static data viewer"
            "https://github.com/dcecile/pr-quest"
        , ProjectsItemData
            "/tmp/blog"
            "Rails / Bootstrap"
            "First deployed Rails app"
            "https://github.com/dcecile/tmp-blog"
        , ProjectsItemData
            "RTT"
            "React / CSS3"
            "Animations & transitions"
            "https://github.com/dcecile/reactic-tac-toe"
        , ProjectsItemData
            "Yomikata"
            "C++ / Qt"
            "Snappy desktop manga reader"
            "https://github.com/dcecile/yomikata-qt"
        , ProjectsItemData
            "URBS"
            "Lua / LÖVE"
            "Deck building + baking game"
            "https://github.com/dcecile/ultra-rainbow-bake-sale"
        , ProjectsItemData
            "TWB"
            "Vue.js / Go"
            "Twitter content library"
            "https://tinyworkerbee.social/"
        , ProjectsItemData
            "(This website)"
            "Elm / CSS3"
            "My portfolio and resume"
            "https://github.com/dcecile/dcecile-resume-portfolio"
        ]
    , outro = Nothing
    }
