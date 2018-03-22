module ListExTests exposing (all)

import Expect
import ListEx
import Test exposing (Test, concat, describe, test)
import TestEx exposing (testAll)


all : Test
all =
    concat
        [ describe "find" findTests
        , describe "findMap" findMapTests
        ]


findTests : List Test
findTests =
    findGenericTests
        ListEx.find
        (Maybe.map (always True) >> Maybe.withDefault False)
        identity


findMapTests : List Test
findMapTests =
    let
        transform =
            (*) 2
    in
    findGenericTests
        ListEx.findMap
        (Maybe.map transform)
        transform


findGenericTests : ((Int -> a) -> List Int -> Maybe b) -> (Maybe Int -> a) -> (Int -> b) -> List Test
findGenericTests findGeneric modifyCondition modifyResult =
    let
        one =
            4 + 1

        two =
            4 + 2

        three =
            4 + 3

        run input =
            findGeneric
                (condition input)
                [ one
                , two
                , three
                , one + 4
                , two + 4
                , three + 4
                ]

        condition input item =
            modifyCondition <|
                if item % 4 == input then
                    Just item
                else
                    Nothing
    in
    [ testAll "positive"
        [ ( 1, modifyResult one )
        , ( 2, modifyResult two )
        , ( 3, modifyResult three )
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
