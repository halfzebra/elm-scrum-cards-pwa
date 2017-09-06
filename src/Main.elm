module Main exposing (..)

import Html exposing (Html, text, div, button)
import Html.Attributes exposing (class, classList, style)
import Html.Events exposing (onClick)
import View.Card


---- MODEL ----


deck =
    [ 0, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ]


type alias Model =
    { current : Maybe String }


init : ( Model, Cmd Msg )
init =
    ( { current = Nothing }, Cmd.none )



---- UPDATE ----


type Msg
    = Picked String
    | Back


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Picked val ->
            ( { model | current = Just val }, Cmd.none )

        Back ->
            ( { model | current = Nothing }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view { current } =
    div
        []
        [ button
            [ onClick Back
            , style
                (if current == Nothing then
                    [ ( "visibility"
                      , "hidden"
                      )
                    ]
                 else
                    []
                )
            ]
            [ text "Back" ]
        , div
            [ class "flip-container"
            , classList [ ( "hover", not (current == Nothing) ) ]
            ]
            [ div
                [ class "flipper" ]
                [ div
                    [ class "front" ]
                    [ div
                        [ class "deck" ]
                        (deck
                            |> List.map toString
                            |> List.map (\label -> View.Card.view label Picked)
                        )
                    ]
                , div
                    [ class "back"
                    ]
                    [ text (toString current) ]
                ]
            ]
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
