module View.Mindsets
    exposing
        ( viewMindsets
        )

import Assets exposing (Assets)
import Css exposing (Em, alignItems, backgroundColor, capitalize, center, em, flexWrap, height, justifyContent, marginBottom, minWidth, textTransform, width, wrap)
import CssShorthand exposing (batchMap, displayFlexColumn, displayFlexRow, marginRightLeft, marginTopBottom)
import Data exposing (Data)
import Data.Mindsets exposing (MindsetsData, MindsetsItemData)
import Html.Styled exposing (Html, a, div, span, styled, text)
import Html.Styled.Attributes exposing (href)
import HtmlShorthand exposing (onClickPreventDefault)
import Msg exposing (Msg, clickDetailsOpen)
import Svg.Styled exposing (Svg)
import View.Breakpoints exposing (breakpointMedium)
import View.Button as Button
import View.Castle exposing (viewCastle)
import View.Chart exposing (viewChart)
import View.Colors exposing (white)
import View.Diamond exposing (viewDiamond)
import View.Fire exposing (viewFire)
import View.MindsetsCircle exposing (viewMindsetsCircle)
import View.Section exposing (viewSection)
import View.Seedling exposing (viewSeedling)
import View.Wheel exposing (viewWheel)


itemSizeSmall : Em
itemSizeSmall =
    em 9.0


itemSizeLarge : Em
itemSizeLarge =
    em 11.0


itemButtonOffset : Em
itemButtonOffset =
    em -3.4


itemButtonWidthSmall : Em
itemButtonWidthSmall =
    em 5.3


itemButtonWidthLarge : Em
itemButtonWidthLarge =
    em 6.1


viewMindsets : Assets -> Data -> Html Msg
viewMindsets assets data =
    let
        sectionData =
            data.mindsets
    in
    viewSection
        assets.iconSource
        sectionData
        [ viewItems sectionData
        ]


viewItems : MindsetsData -> Html Msg
viewItems data =
    let
        style =
            [ displayFlexRow
            , flexWrap wrap
            , justifyContent center
            , marginBottom <| em 0.8
            ]
    in
    [ ( .making, viewCastle )
    , ( .learning, viewSeedling )
    , ( .teaching, viewFire )
    , ( .analyzing, viewChart )
    , ( .coordinating, viewWheel )
    , ( .improving, viewDiamond )
    ]
        |> List.map (\( itemSelector, illustration ) -> viewItem (itemSelector data) illustration)
        |> styled div style []


viewItem : MindsetsItemData -> Svg Msg -> Html Msg
viewItem item illustration =
    let
        style =
            [ Button.text
            , displayFlexColumn
            , alignItems center
            , batchMap [ width, height ] itemSizeLarge
            , breakpointMedium
                [ batchMap [ width, height ] itemSizeSmall
                ]
            , marginBottom <| em 0.8
            , marginRightLeft <| em 0.8
            ]
    in
    styled a
        style
        [ href "#"
        , onClickPreventDefault (clickDetailsOpen item)
        ]
        [ viewItemBackground illustration
        , viewItemLink item.name
        ]


viewItemBackground : Svg Msg -> Html Msg
viewItemBackground illustration =
    let
        style =
            [ batchMap [ width, height ] itemSizeLarge
            , breakpointMedium
                [ batchMap [ width, height ] itemSizeSmall
                ]
            , marginBottom itemButtonOffset
            ]
    in
    viewMindsetsCircle style illustration


viewItemLink : String -> Html Msg
viewItemLink name =
    let
        style =
            [ Button.borderCenter
            , Button.sizeMedium
            , minWidth itemButtonWidthLarge
            , breakpointMedium
                [ minWidth itemButtonWidthSmall
                ]
            , backgroundColor white
            , textTransform capitalize
            ]
    in
    styled span
        style
        []
        [ text name ]
