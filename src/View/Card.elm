module View.Card exposing (view)

import Html exposing (div, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class)


view label msg =
    div [ onClick (msg label), class "card" ] [ text label ]
