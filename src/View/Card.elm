module View.Card exposing (view)

import Html exposing (Html, div, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, style)


view : String -> msg -> Html msg
view label msg =
    div
        [ onClick msg, class "card" ]
        [ div
            [ class "inner", style [ ( "position", "relative" ) ] ]
            [ div
                [ class "card-label" ]
                [ text label ]
            ]
        ]
