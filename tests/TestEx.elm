module TestEx exposing (testAll)

import Debug
import Expect exposing (Expectation)
import Test exposing (Test, concat, test)


testAll : String -> List a -> (a -> Expectation) -> Test
testAll name items expectation =
    let
        testOne item =
            test
                (String.concat [ name, " (", Debug.toString item, ")" ])
                (\() -> expectation item)
    in
    items
        |> List.map testOne
        |> concat
