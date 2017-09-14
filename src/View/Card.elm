module View.Card exposing (view)

import Html exposing (Html, div, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)


view : String -> msg -> Html msg
view label msg =
    div
        [ onClick msg, class "card third" ]
        [ div [ class "inner" ] [ text label ] ]
