module View.Card exposing (view)

import Html exposing (Html, div, text)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)


view : String -> msg -> Html msg
view label msg =
    div
        [ onClick msg
        , class "card"
        , style "background"  "#ECF0F1"
        , style "box-shadow" "#3498DB 0px 0px 0px 5px"
        , style "border-radius" "10px"
        ]
        [ div
            [ class "inner"
            , style "position" "relative"
            , style "box-shadow" "#2980B9 0px 0px 0px 5px inset"
            , style "border-radius" "10px"
            ]
            [ div
                [ class "card-label"
                , style "color" "#2C3E50"
                , style "font-family" "monospace"
                , style "font-size" "3em"
                ]
                [ text label ]
            ]
        ]
