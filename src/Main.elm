module Main exposing (Model, Msg(..), deck, default, init, main, update, view)

import Browser
import Html exposing (Html, button, div, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import View.Card
import View.Flip


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
    | Hide String
    | Back


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Picked val ->
            ( { model | current = Just val, flip = True }, Cmd.none )

        Hide val ->
            ( model, Cmd.none )

        Back ->
            ( { model | flip = False }, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view { current, flip } =
    div
        [ class "wrapper"
        , style "background" "#2C3E50"
        ]
        [ View.Flip.view
            flip
            (deck
                |> List.map String.fromInt
                |> List.map (\label -> View.Card.view label (Picked label))
                |> List.map (\v -> div [ class "third card-wrapper" ] [ v ])
            )
            [ div [ class "full card-wrapper", onClick Back ]
                [ current
                    |> Maybe.withDefault (String.fromInt default)
                    |> (\label -> View.Card.view label (Hide label))
                ]
            ]
        ]



---- PROGRAM ----


main =
    Browser.element
        { view = view
        , init = \() -> init
        , update = update
        , subscriptions = always Sub.none
        }
