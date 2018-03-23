module ListExTests exposing (all)

import Expect
import ListEx
import Test exposing (Test, concat, describe, test)
import TestEx exposing (testAll)


all : Test
all =
    concat
        [ describe "find" findTests
        ]


findTests : List Test
findTests =
    let
        one =
            4 + 1

        two =
            4 + 2

        three =
            4 + 3

        run input =
            ListEx.find
                (condition input)
                [ one
                , two
                , three
                , one + 4
                , two + 4
                , three + 4
                ]

        condition input item =
            item % 4 == input
    in
    [ testAll "positive"
        [ ( 1, one )
        , ( 2, two )
        , ( 3, three )
        ]
        (\( input, output ) ->
            Expect.equal
                (Just output)
                (run input)
        )
    , test "negative"
        (\_ ->
            Expect.equal
                Nothing
                (run 0)
        )
    ]
