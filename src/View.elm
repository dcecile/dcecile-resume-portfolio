module View
    exposing
        ( alsoViewHead
        , subscribe
        , view
        )

import Css exposing (hidden, overflow)
import Head exposing (Head)
import HeadPort exposing (sendHead)
import Html.Styled exposing (Html, div, styled)
import MaybeEx
import Model exposing (Model)
import Msg exposing (Msg(HashChange))
import Navigation exposing (onHashChange)
import View.Details exposing (maybeSubscribeDetails, maybeViewDetails)
import View.Portfolio exposing (viewPortfolio)
import View.Resume exposing (viewResumeName)
import View.ResumeDisplay exposing (viewResumeDisplay)
import View.ResumePrint exposing (viewResumePrint)


view : Model -> Html Msg
view model =
    let
        style =
            [ overflow hidden
            ]
    in
    (styled div style [] << List.concat)
        [ if model.resumeDisplay then
            List.singleton <|
                viewResumeDisplay model
          else
            List.concat
                [ viewPortfolio model |> List.singleton
                , maybeViewDetails model |> MaybeEx.toList
                ]
        , viewResumePrint model |> List.singleton
        ]


alsoViewHead : ( Model, Cmd Msg ) -> ( Model, Cmd Msg )
alsoViewHead ( model, cmd ) =
    ( model
    , Cmd.batch
        [ cmd
        , sendHead (viewHead model)
        ]
    )


viewHead : Model -> Head
viewHead model =
    { title = viewTitle model
    , favicon = viewFavicon model
    }


viewTitle : Model -> String
viewTitle model =
    if model.resumeDisplay then
        viewResumeName model
    else
        model.data.basic.name ++ "’s portfolio homepage"


viewFavicon : Model -> String
viewFavicon model =
    if model.resumeDisplay then
        model.faviconSource.resume
    else
        model.faviconSource.portfolio


subscribe : Model -> Sub Msg
subscribe model =
    Sub.batch
        [ onHashChange HashChange
        , maybeSubscribeDetails model |> Maybe.withDefault Sub.none
        ]
