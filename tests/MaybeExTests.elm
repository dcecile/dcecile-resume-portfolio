module MaybeExTests exposing (all)

import Expect
import MaybeEx
import Test exposing (Test, concat, describe, test)


all : Test
all =
    concat
        [ describe "toList" toListTests
        ]


toListTests : List Test
toListTests =
    [ test "Just"
        (\_ ->
            Expect.equal
                [ 10 ]
                (MaybeEx.toList <| Just 10)
        )
    , test "Nothing"
        (\_ ->
            Expect.equal
                []
                (MaybeEx.toList Nothing)
        )
    ]
