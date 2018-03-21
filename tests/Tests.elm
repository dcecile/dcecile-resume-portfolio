module Tests exposing (all)

import MaybeExTests exposing (testMaybeEx)
import Test exposing (Test, describe)


all : Test
all =
    describe "tests"
        [ testMaybeEx
        ]
