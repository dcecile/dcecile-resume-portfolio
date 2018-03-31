module UpdateTests exposing (all)

import Data exposing (initData)
import Data.Details exposing (allDetailsItems)
import Expect
import MarkedString
import Set
import Test exposing (Test, concat, describe)
import TestEx exposing (testAll)
import Update exposing (findDetailsItem)


all : Test
all =
    concat
        [ describe "findDetailsItem" findDetailsItemTests
        ]


findDetailsItemTests : List Test
findDetailsItemTests =
    let
        allItems =
            allDetailsItems initData

        allTests =
            allItems
                |> List.map
                    (\item ->
                        ( item.name
                        , item.points
                            |> List.concatMap (MarkedString.transform (always []) List.singleton)
                            |> List.concat
                            |> Set.fromList
                        )
                    )
                |> List.filter
                    (\( _, links ) ->
                        not (Set.isEmpty links)
                    )

        loop ( name, links ) =
            describe name
                [ testAll "link"
                    (links |> Set.toList)
                    (\input ->
                        Expect.notEqual
                            Nothing
                            (findDetailsItem input allItems)
                    )
                ]
    in
    List.map loop allTests
