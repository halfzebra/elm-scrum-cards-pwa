module Main exposing (..)

import Html exposing (Html, text, div, button)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import View.Card
import View.Flip


---- MODEL ----


deck : List Int
deck =
    [ default, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ]


default : Int
default =
    0


type alias Model =
    { current : Maybe String, flip : Bool }


init : ( Model, Cmd Msg )
init =
    ( { current = Nothing, flip = False }, Cmd.none )



---- UPDATE ----


type Msg
    = Picked String
    | Back
    | Hide String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Picked val ->
            ( { model | current = Just val, flip = True }, Cmd.none )

        Back ->
            ( { model | flip = False }, Cmd.none )

        Hide val ->
            ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view { current, flip } =
    div
        [ class "wrapper" ]
        [ button
            [ onClick Back
            , style
                (if not flip then
                    [ ( "visibility", "hidden" ) ]
                 else
                    []
                )
            ]
            [ text "Back" ]
        , View.Flip.view
            flip
            (deck
                |> List.map toString
                |> List.map (\label -> View.Card.view label (Picked label))
                |> List.map (\v -> div [ class "third card-wrapper" ] [ v ])
            )
            [ div [ class "full card-wrapper" ]
                [ current
                    |> Maybe.withDefault (toString default)
                    |> \label -> View.Card.view label (Hide label)
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
