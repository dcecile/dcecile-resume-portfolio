module View exposing
    ( alsoViewHead
    , subscribe
    , view
    )

import Assets exposing (Assets)
import Css exposing (hidden, overflow)
import Data exposing (Data)
import Display exposing (Display)
import Head exposing (Head)
import HeadPort exposing (sendHead)
import Html.Styled exposing (Html, div, styled)
import LazyHtml exposing (fromLazyHtml2)
import MaybeEx
import Model exposing (Model)
import Msg exposing (Msg(..))
import Navigation exposing (onHashChange)
import View.Details exposing (maybeSubscribeDetails, maybeViewDetails)
import View.Portfolio exposing (viewPortfolio)
import View.Resume exposing (viewResumeName)
import View.ResumePreview exposing (viewResumePreview)
import View.ResumePrint exposing (viewResumePrint)


view : Data -> Model -> Html Msg
view data { assets, display } =
    let
        style =
            [ overflow hidden
            ]
    in
    (styled div style [] << List.concat)
        [ viewPortfolio assets data display |> List.singleton
        , maybeViewDetails assets display |> MaybeEx.toList
        , viewResumePreview assets data display |> List.singleton
        , fromLazyHtml2 viewResumePrint assets data |> List.singleton
        ]


alsoViewHead : Data -> ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
alsoViewHead data ( model, cmd ) =
    ( model
    , Cmd.batch
        [ cmd
        , sendHead (viewHead data model)
        ]
    )


viewHead : Data -> Model -> Head
viewHead data { assets, display } =
    { title = viewTitle data display
    , favicon = viewFavicon assets display
    }


viewTitle : Data -> Display -> String
viewTitle data display =
    if display.showResumePreview then
        viewResumeName data

    else
        data.basic.name ++ "’s portfolio homepage"


viewFavicon : Assets -> Display -> String
viewFavicon assets display =
    if display.showResumePreview then
        assets.faviconSource.resume

    else
        assets.faviconSource.portfolio


subscribe : Model -> Sub Msg
subscribe { display } =
    Sub.batch
        [ onHashChange HashChange
        , maybeSubscribeDetails display |> Maybe.withDefault Sub.none
        ]
