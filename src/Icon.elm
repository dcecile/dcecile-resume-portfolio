module Icon
    exposing
        ( IconBackground
        , IconSource
        , fiveHundredPxBackground
        , githubBackground
        , linkedinBackground
        , mailBackground
        , printerBackground
        , stackOverflowBackground
        , twitterBackground
        )

import Css exposing (Style, backgroundImage, backgroundOrigin, backgroundPosition, backgroundRepeat, backgroundSize, batch, center, contain, contentBox, noRepeat, url)


type alias IconSource =
    { fiveHundredPx : String
    , github : String
    , linkedin : String
    , mail : String
    , printer : String
    , stackOverflow : String
    , twitter : String
    }


type alias IconBackground =
    IconSource -> Style


iconBackground : (IconSource -> String) -> IconBackground
iconBackground selector source =
    batch
        [ backgroundImage (url <| selector source)
        , backgroundRepeat noRepeat
        , backgroundPosition center
        , backgroundSize contain
        , backgroundOrigin contentBox
        ]


fiveHundredPxBackground : IconBackground
fiveHundredPxBackground =
    iconBackground .fiveHundredPx


githubBackground : IconBackground
githubBackground =
    iconBackground .github


linkedinBackground : IconBackground
linkedinBackground =
    iconBackground .linkedin


mailBackground : IconBackground
mailBackground =
    iconBackground .mail


printerBackground : IconBackground
printerBackground =
    iconBackground .printer


stackOverflowBackground : IconBackground
stackOverflowBackground =
    iconBackground .stackOverflow


twitterBackground : IconBackground
twitterBackground =
    iconBackground .twitter
