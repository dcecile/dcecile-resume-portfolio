module MaybeExTests exposing (testMaybeEx)

import Expect
import MaybeEx
import Test exposing (Test, describe, test)


testMaybeEx : Test
testMaybeEx =
    describe "MaybeEx"
        [ describe "toList"
            [ test "Just" <|
                \_ ->
                    Expect.equal [ 10 ] (MaybeEx.toList <| Just 10)
            , test "Nothing" <|
                \_ ->
                    Expect.equal [] (MaybeEx.toList Nothing)
            ]
        ]
