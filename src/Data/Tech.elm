module Data.Tech exposing
    ( TechData
    , TechItemData
    , initTechData
    )

import Data.Section exposing (SectionData)
import Data.Visibility exposing (ResumeVariant(..), Visibility, portfolioAndResume, portfolioOnly)
import MarkedString exposing (MarkedString, markedString)


type alias TechData =
    SectionData
        { items : List TechItemData
        }


type alias TechItemData =
    { name : String
    , shortName : Maybe String
    , detailsIntro : MarkedString
    , detailsPoints : List MarkedString
    , visibility : Visibility
    }


initTechData : TechData
initTechData =
    { id = "tech"
    , name = "Tech skills"
    , portfolioIconBackground = .box
    , detailsNoun = "skill"
    , portfolioIntro =
        "I’m serious about learning new skills and improving my old ones. New skills bring new perspectives and open new doors. Through practice, old skills reveal the keys to mastery."
    , items =
        [ TechItemData
            "Amazon Web Services"
            (Just "AWS")
            (markedString "At `Meya`, our `Python` chatbot platform was originally built for and hosted on AWS.")
            [ markedString "I set up a CloudWatch `monitoring` dashboard, tied to alerts and including custom metrics"
            , markedString "I helped debug and resolve issues related to DynamoDB and ElastiCache (`Redis`) load"
            , markedString "I set up a new `Docker`-based, `Node.js` ECS service that used ALB sticky sessions"
            , markedString "I tuned our EC2 autoscaling rules to optimize costs while maintaining platform stability and low latency"
            ]
            portfolioOnly
        , TechItemData
            "bug reporting"
            Nothing
            (markedString "Writing clear and informative bug reports is a key skill for any member of a software development team. It’s one that I’ve been practising since my second internship:")
            [ markedString "At `Coreworx`, during my time helping QA with testing, I learned the keys to effective bug reporting"
            , markedString "At `Sonova`, I continued to work at `improving` my bug reporting as I logged bugs for software components maintained by other teams"
            , markedString "At `Sonova`, I regularly triaged my team’s bugs, and spent time `teaching` others what to fix for unclear bug reports"
            , markedString "At `Meya`, I converted customer problem reports into clear and actionable bug reports for our team to resolve"
            ]
            portfolioOnly
        , TechItemData
            "C#"
            Nothing
            (markedString "By now, I’ve read and written more code in .NET’s C# than in any other programming language. I have a solid grasp of advanced features like LINQ, reflection, code generation, and generics. I know how to write good, maintainable C#.")
            [ markedString "At `Coreworx`, I first used C# to add features to an ASP.NET document management system"
            , markedString "At `Sonova`, I used C# for 8 years as I implemented and maintained manufacturing subsystems"
            , markedString "At `Sonova`, I used C# together with `SQL` to create internal tools focused on `improving` development and QA processes"
            , markedString "At `Sonova`, I used C# `threads` and async/await to build WinForms apps that don’t freeze during extended network and CPU tasks"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "continuous integration and deployment"
            (Just "CI/CD")
            (markedString "I have a strong interest in build systems and continuous integration/deployment:")
            [ markedString "Starting at `LSI Logic`, and continuing at `NexJ Systems`, `Sonova`, and `Meya`, I’ve made build systems improvements for maintainability and productivity"
            , markedString "At `Meya`, I set up continuous deployment that included `Kubernetes` rolling deployment upgrades, `React` builds, and `Google Cloud Platform` cloud storage uploads"
            , markedString "For all my recent projects (incluing at `Meya` and in `Pentagram` and `My Portfolio and Resume`), I’m using GitHub Actions for CI/CD, taking advantage of PR status reporting, caching, and branch-conditional steps"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "code review"
            Nothing
            (markedString "With my teams at `Meya` and `Sonova`, every change required code review approval before merging in `version control`:")
            [ markedString "This offers excellent opportunities for `learning` and `teaching` about code maintainability as well as specific software features, components, and technologies"
            , markedString "Diligently using code reviews was a key step in `improving` the quality of our software"
            , markedString "We found that the time spent on reviews was a net positive for our team’s productivity"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "CSS"
            Nothing
            (markedString "These days, my primary tool for `visual design` is CSS, for making HTML web applications:")
            [ markedString "At `Meya`, I used CSS with `React` to build our chat UI SDK, developer web console, and new company website"
            , markedString "At `Sonova`, I used CSS to implement a hybrid HTML desktop app according to initial mockups"
            , markedString "In `Forks in the Road`, I leveraged my Qt experience to set up CSS flexbox layouts"
            , markedString "In `My Portfolio and Resume` and `Meya`, I used media queries for `responsive design`"
            , markedString "With `Forks in the Road`, I began `learning` how to do `functional animation` with CSS3 transitions and animations"
            ]
            (portfolioAndResume [ GeneralResume, ElmResume ])
        , TechItemData
            "data analysis"
            Nothing
            (markedString "At `Sonova`, I used Excel together with `SQL` for `analyzing` data:")
            [ markedString "I used pivot tables and pivot charts to explore trends and correlations"
            , markedString "I copied table and chart summaries into emails—to help communicate the data to managers"
            , markedString "I linked data directly to `SQL` tables and views, to create live reports"
            , markedString "I imported data into Microsoft’s Power BI for more advanced drill-down reporting"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "debugging"
            Nothing
            (markedString "A core software developer skill, I approach debugging as an exiting puzzle to solve, no matter how challenging.")
            [ markedString "At `Meya`, I debugged complex customer issues using `log tracing` and clearly communicated my findings, whether that included customer fixes, workarounds, or bugfixes on our side"
            , markedString "At `Sonova`, I debugged manufacturing issues with the help of `data analysis` which resulted in manufacturing process and QC changes"
            , markedString "At `LSI Logic`, I worked on a visual debugger capable of visually highlighting how a video was encoded"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "Django"
            Nothing
            (markedString "The SaaS business logic at `Meya` was all written in this `Python` web framework, so I am very comfortable with Django after `learning` and using it for more than 4 years.")
            [ markedString "We used Celery for scheduling periodic and delayed tasks"
            , markedString "We used Graphene-Django for serving `GraphQL` requests and Django REST framework for `REST` requests"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "Docker"
            Nothing
            (markedString "Although I have some experience running desktop VMs and EC2 VMs on `Amazon Web Services`, `Linux` Docker images have been great for `making` back-end software.")
            [ markedString "At `Meya`, we used Docker heavily, with a couple services runing on `Amazon Web Services` ECS and our new platform running entirely on `Google Cloud Platform` Kubernetes"
            , markedString "I architected and set up our Docker image build pipeline at `Meya` for running customer apps, using Kaniko inside of `Kubernetes`, dynamically generated Dockerfiles, and an init container that checks out code from `Git`"
            , markedString "With `Fertile Earth`, I set up Docker images for running `Node.js`, Rust, and `Redis` services on Fly.io"
            ]
            portfolioOnly
        , TechItemData
            "domain-specific languages"
            (Just "DSLs")
            (markedString "I have experience both using and creating DSLs:")
            [ markedString "At `Meya`, wrote the parser and interpreter for our YAML / Jinja workflow language, including labeld jumps, tail calls, static checks, and encryption/decryption filters"
            , markedString "At `NexJ Systems`, I used an in-house Scheme DSL with my work on the CRM user interface and business logic"
            , markedString "At `Sonova`, I created a `C#` DSL for specifying related test plans—to improve maintainability and to track history in `version control`"
            , markedString "With `My Portfolio and Resume` and `Fertile Earth`, I’m using `Elm` and `TypeScript` DSLs for writing HTML and `CSS` code"
            ]
            portfolioOnly
        , TechItemData
            "Elm"
            Nothing
            (markedString "Elm is a front-end framework and `functional programming` language that I’m `learning` as I make `My Portfolio and Resume`.")
            []
            (portfolioAndResume [ ElmResume ])
        , TechItemData
            "event streams"
            Nothing
            (markedString "Using an event-oriented architecture was key to `scale` and `security` of the `Meya` v2 platform I worked on. We used event streams to represent all runtime 'happenings', from user events to bot flow calls to log entries, and emergent benefits were excellent. `Redis` Streams also turned out to be a great match for `WebSockets` used for live client updates.")
            []
            portfolioOnly
        , TechItemData
            "Flutter"
            Nothing
            (markedString "Although the `Meya` web chat UI was written in `React`, we decided Flutter would be a better fit for our mobile UI. I handled some of the initial project setup (including `WebSockets`), and implemented multiple features in Flutter to maintain web/mobile parity.")
            []
            portfolioOnly
        , TechItemData
            "functional programming"
            (Just "FP")
            (markedString "I use this programming style because it helps me cleanly extract sub-problems:")
            [ markedString "At `NexJ Systems`, I had my first, basic introduction to functional programming as I used Scheme for fixing bugs and unit `testing`"
            , markedString "At `Sonova`, functional programming made `test-driven development` easier to apply for a test run comparison `C#` GUI app"
            , markedString "In `My Portfolio and Resume`, functional programming helps keep my `Elm` code well-organized, and makes refactoring a breeze"
            , markedString "In `Off-Grid Orcs`, functional programming helped prevent newly-implemented `Scala` features from breaking existing functionality"
            ]
            (portfolioAndResume [ GeneralResume, ElmResume, GoResume ])
        , TechItemData
            "functional animation"
            Nothing
            (markedString "Functional animation helps me remove surprise from my UIs during state changes:")
            [ markedString "At `Meya`, I used Frame Motion animations in `React` to make the UI feel responsive as new conversational events happen"
            , markedString "In `Ultra Rainbow Bake Sale`, I used functional animation in `Lua` to give the game a more lively feel"
            , markedString "In `Forks in the Road`, I use functional animation for all `React` page changes and form actions"
            ]
            portfolioOnly
        , TechItemData
            "Gatling"
            Nothing
            (markedString "Our tool of choice at `Meya` for load testing was Gatling. We ran it from an isolated pod in our `Kubernetes` cluster, and it helped me test `scale`-up surge scenarios and memory leak fixes.")
            []
            portfolioOnly
        , TechItemData
            "Git"
            Nothing
            (markedString "The new de facto standard `version control` system, I use it for all my new projects. At `Meya`, we also used it to store customer code and sync between server, CLI (using pygit2 in `Python`), and web console (using isomorphic-git in `JavaScript`).")
            []
            portfolioOnly
        , TechItemData
            "GraphQL"
            Nothing
            (markedString "To improve the dev loop speed for our web console at `Meya`, we used a GraphQL API for all our data access. I worked with the Apollo `JavaScript` and sgqlc `Python` clients and the Graphene-`Django` and aiohttp-graphql `Python` servers.")
            [ ]
            portfolioOnly
        , TechItemData
            "Google Cloud Platform"
            (Just "GCP")
            (markedString "In my work at `Meya`, I became very familiar with GCP, `learning` and using my different services:")
            [ markedString "I deployed releases to Google `Kubernetes` Engine, `debugging` and `monitoring` as needed with the K9s terminal"
            , markedString "I set up static hosting and secure user uploads using Google Cloud Storage"
            , markedString "I investigated customer issues by `log tracing` in Cloud Logging, writing queries in GQL"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "integration"
            Nothing
            (markedString "Glue code, value add, whatever you call it, I have experience `making` high quality integrations:")
            [ markedString "At `Meya` with `Python`, I integrated our `event streams` with other messaging and customer service platforms using `REST` APIs and webhooks"
            , markedString "At `Sonova` with `C#`, our team was integrated libraries and applications from other teams to deploy to manufacturing environments for configuring and `testing` hearing instruments"
            , markedString "WIth `Yomikata` with C++, I integrated the 7-Zip executable over ICP for working with archive files"
            ]
            portfolioOnly
        , TechItemData
            "internationalization & localization"
            (Just "i18n & l10n")
            (markedString "I’m passionate about languages, so `learning` and diving into i18n & l10n has felt like a natural progression for my dev career:")
            [ markedString "At `Meya`, I enabled customers to use gettext in `Python` and our custom YAML language to add translations to their apps hosted in our `Kubernetes` cluster"
            , markedString "On my team at `Sonova`, I was in charge of our translation processes—this included converting our apps to support translations and managing all of our translation tools and processes, `coordinating` translator activities for up to 14 languages"
            ]
            portfolioOnly
        , TechItemData
            "JavaScript"
            Nothing
            (markedString "I use JavaScript and `TypeScript` for most of my front-end development (including modern language features like modules, await, and classes):")
            [ markedString "At `Meya`, I used JavaScript to build the developer web console, including a visual flow editor powered by `SVG`"
            , markedString "At `Sonova`, I used JavaScript for the UI logic of a hybrid HTML and `C#` desktop app"
            , markedString "In `Forks in the Road`, I used JavaScript with `React` for the front-end of my value estimation web app"
            ]
            portfolioOnly
        , TechItemData
            "Kubernetes"
            Nothing
            (markedString "At `Meya`, Kubernetes was a perfect for the `scale` and `security` we needed to run customer apps.")
            [ markedString "I set up a `Docker` image build pipeline using Kaniko jobs"
            , markedString "I designed services and deployments that spanned our console, gateway, and customer app"
            , markedString "I used init containers to pull dev app code from `Git` for faster live coding"
            , markedString "I used RBAC and service accounts to follow the principle of least privilege, and enable access to `Google Cloud Platform` services"
            , markedString "I did all my `debugging` using K9s and `Google Cloud Platform` `log tracing`"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "Linux"
            Nothing
            (markedString "I’m comfortable working in Linux, having used it for my primary development environment since university:")
            [ markedString "I know my way around the command line (e.g. for `version control`, shell scripts, and personal system adminitration)"
            , markedString "I troubleshoot my Linux system problems using system logs, application logs, man pages, GDB, Google searches, and bug searches"
            , markedString "I’ve built a couple cross-platform desktop applications: `Ultra Rainbow Bake Sale` and `Yomikata`"
            , markedString "(I also have lots of experience using and troubleshooting Windows)"
            ]
            (portfolioAndResume [ GoResume ])
        , TechItemData
            "log tracing"
            Nothing
            (markedString "Depending on the problem, an interactive debugger might not be the right tool and you’ve gotta go to the logs:")
            [ markedString "At `Meya`, I traced logs in `Google Cloud Platform`, piecing together timelines with the help of ad hoc `SQL` queries"
            , markedString "At `Sonova`, I traced logs across multiple desktop PCs to solve production issues"
            ]
            portfolioOnly
        , TechItemData
            "Lua"
            Nothing
            (markedString "I finally learned Lua and used it with LÖVE (a 2D game development library) to build a single-player, deck-building, baking game: `Ultra Rainbow Bake Sale`. At `Meya`, I also used `Lua` in `Redis` to manipulate `event streams`, with unit `testing` driven from `Python`.")
            []
            portfolioOnly
        , TechItemData
            "monitoring"
            Nothing
            (markedString "Sometimes to verify software quality, you need data and graphs to really understand a system. At `Meya`, I used monitoring in `Amazon Web Services` and `Google Cloud Platform` for our production systems to debug and fix production issues, and set up alerts to protect against future regressions.")
            [ ]
            portfolioOnly
        , TechItemData
            "nginx"
            Nothing
            (markedString "At `Meya`, we used nginx together with `Django`. I set up ngnix reverse proxies to `Git` and Pypi services, secured using developer auth tokens.")
            [ ]
            portfolioOnly
        , TechItemData
            "Node.js"
            Nothing
            (markedString "Along with `Python` `Django` and aiohttp back-ends, I’m familiar with using `JavaScript` and `TypeScript` to write Node.js services.")
            [ markedString "At `Meya`, I set up a Node.js `REST` endpoint to fetch data from our Prismic CMS for homepage content"
            , markedString "At `Meya`, I implemented a `Docker` Node.js `integration` service to provide persistent access to a customer service platform"
            , markedString "In `Fertile Earth`, the app back-end runs Node.js to allow sharing `TypeScript` code between client and server"
            ]
            portfolioOnly
        , TechItemData
            "pair programming"
            Nothing
            (markedString "When working on especially complex or high-risk tasks, pair programming can be great productivity and QC tool. At `Meya` and `Sonova`, I also found it especially effective for `teaching` and mentoring.")
            [ ]
            portfolioOnly
        , TechItemData
            "PostgreSQL"
            Nothing
            (markedString "Recently my `SQL` server of choice has been PostgreSQL, especially for its JSON support and concurrent index updates.")
            [ markedString "At `Meya`, I regularly used ad hoc queries for investigating and `debugging` customer issues"
            , markedString "At `Meya`, I built a custom AST transformer from Lucene syntax to windowed, index-aware PostgreSQL syntax (including deep JSON filters) in `Python`"
            , markedString "With `Fertile Earth`, I connected to the distributed, PostgreSQL-compatible CockroachDB cloud service from `Node,js`"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "profiling"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "Python"
            Nothing
            (markedString "With `bitfontmake`, I’ve used Python to compile my TTF fonts from a custom pixel-based input format. I deployed this code to Heroku as a Flask application.")
            []
            (portfolioAndResume [ GeneralResume, GoResume ])
        , TechItemData
            "React"
            Nothing
            (markedString "I’m `learning` React to get experience with today’s most popular front-end framework (according to The State of JavaScript 2017):")
            [ markedString "With `Forks in the Road`, I’m using React to create the front-end of my value estimation web app"
            , markedString "(I’ve also used Vue.js and `Elm` for creating HTML front-ends)"
            ]
            (portfolioAndResume [ GeneralResume, ElmResume, GoResume ])
        , TechItemData
            "Redis"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "responsive design"
            Nothing
            (markedString "The promise of HTML web apps is that they’ll run in any modern browser. I use responsive design to make sure that mobile devices are included too:")
            [ markedString "I implement responsive design by using `CSS` media queries to progressively enabling more advanced styling for larger screens"
            , markedString "I’ve set up responsive design for `My Portfolio and Resume`"
            ]
            (portfolioAndResume [ ElmResume ])
        , TechItemData
            "REST"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        , TechItemData
            "Scala"
            Nothing
            (markedString "I’ve enjoyed using Scala as a `functional programming` language:")
            [ markedString "For a previous generation of my `Pentagram` programming language, I took advantage of support for `functional programming` from  of Scala’s type system and standard library"
            , markedString "I used Scala.js to create `Off-Grid Orcs` as an HTML game with a `functional programming` architecture"
            ]
            portfolioOnly
        , TechItemData
            "scale"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "security"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "SQL"
            Nothing
            (markedString "At `Sonova`, I used `SQL` for `analyzing` data and creating internal development/QA tools:")
            [ markedString "I used Excel together with ad hoc SQL queries to investigate bugs and communicate my findings"
            , markedString "I optimized my ad hoc SQL queries to run on large datasets that were initially impossible"
            , markedString "I created an SQL data warehouse with materialized views, for analyzing trends that spanned multiple upstream DBs"
            , markedString "I used `C#` and SQL via `continuous integration and deployment` for populating and `monitoring` the data warehouse"
            , markedString "I used the SQL materialized views in internal development and QA tools, with `C#` and WinForms"
            ]
            portfolioOnly
        , TechItemData
            "SVG"
            Nothing
            (markedString "I use SVG in my HTML applications, and I know its capabilities (and limitations).")
            [ markedString "At `Sonova`, I created an interactive SVG document (via the D3.js `JavaScript` library) for `teaching` our network topology of production/test servers and databases"
            , markedString "At `Sonova`, I designed and used SVG icons for a hybrid HTML desktop app"
            , markedString "For `Forks in the Road`, I began my `visual design` by creating SVG mockup in Inkscape"
            , markedString "For `My Portfolio and Resume`, I created SVG illustrations in `Elm`—animating them using `CSS`"
            ]
            portfolioOnly
        , TechItemData
            "system architecture"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "test-driven development"
            (Just "TDD")
            (markedString "I’ve done TDD and experienced its benefits for both `testing` and `making` software. (I’m still working at using it more often.)")
            [ markedString "At `Meya` with `Python`, I used TDD when developing new `integration` elements, mocking out payloads and `event streams`"
            , markedString "At `Sonova` with `C#`, I followed test-driven development to build a test run comparison tool"
            , markedString "In `Pentagram` with `Scala`, I wrote an initial parser using TDD"
            , markedString "In `Forks in the Road` with Ruby, I used TDD to add back-end functionality"
            ]
            portfolioOnly
        , TechItemData
            "testing"
            Nothing
            (markedString "In `making` software, you’re alternative between coding, `debugging`, and testing, so it’s worth it to hone your testing skills. That includes writing automated unit or integration tests, as well as manual testing. Good `bug reporting` is also key when a bug needs to be fixed later or by another team.")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "technical requirements"
            Nothing
            (markedString "I’m comfortable using technical requirements documents as a communication medium:")
            [ markedString "I’ve used official specs to write software for H.264 video encoding/decoding (at `LSI Logic`), ANSI hearing instrument testing (at `Sonova`), and XMPP messaging"
            , markedString "At `Sonova`, I wrote clear technical requirements that included contextual information, discussed trade-offs of different solutions, and provided enough detail for correct implementation"
            , markedString "At `Sonova`, I used the technical requirements I’d written negotiating features and implementation details, `making` the software, and introducing the changes to QA"
            , markedString "For `bitfontmake`, I wrote a technical specification to document my custom image-based font format"
            ]
            portfolioOnly
        , TechItemData
            "threads"
            Nothing
            (markedString "I know how to write correct multithreading code, and how to debug threading issues. Threads, mutexes, semaphores, condition variables, and barriers are all familiar tools for me.")
            [ markedString "At `Sonova` with `C#` and WinForms, I used async/await to build Windows desktop applications that perform long-running tasks on background threads"
            , markedString "At `Sonova` with `C#`, I used Parallel LINQ as well as the Task Parallel Library to automatically coordinate background threads"
            , markedString "In `Yomikata` with C++ and Qt, I used threads and processes to unpack and decode images in the background while keeping the UI responsive"
            ]
            portfolioOnly
        , TechItemData
            "TypeScript"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            (portfolioAndResume [ GeneralResume ])
        , TechItemData
            "version control"
            Nothing
            (markedString "I track all of my code with version control:")
            [ markedString "I have experience using Git, SVN, Bazaar, ClearCase, and AccuRev"
            , markedString "I use history annotations for `learning` where code came from and why"
            , markedString "I use change bisection to pinpoint the source of tricky bugs"
            , markedString "I write clear and descriptive commit messages, and use references to external issue tracking systems"
            ]
            portfolioOnly
        , TechItemData
            "visual design"
            Nothing
            (markedString "I use visual design to help my software communicate effectively:")
            [ markedString "I draw my own UI mockups, colour/typography schemes, icons, and logos using Inkscape (`SVG` editing software)"
            , markedString "With `My Portfolio and Resume`, I used `CSS` to create a printable and highly-readable resume that doesn’t follow the standard single column layout"
            , markedString "With `Off-Grid Orcs`, I designed and implemented my first font, with a glyph size of 6x6 pixels"
            ]
            (portfolioAndResume [ ElmResume ])
        , TechItemData
            "WebSockets"
            Nothing
            (markedString "TODO")
            [ markedString "TODO"
            ]
            portfolioOnly
        ]
    , portfolioOutro = Nothing
    }
