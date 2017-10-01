module View.Card exposing (view)

import Html exposing (Html, div, text)
import Html.Events exposing (onClick)
import Html.Attributes exposing (class, style)
import Util exposing ((=>))


view : String -> msg -> Html msg
view label msg =
    div
        [ onClick msg
        , class "card"
        , style
            [ "background" => "#ECF0F1"
            , "box-shadow" => "#3498DB 0px 0px 0px 5px"
            , "border-radius" => "10px"
            ]
        ]
        [ div
            [ class "inner"
            , style
                [ "position" => "relative"
                , "box-shadow" => "#2980B9 0px 0px 0px 5px inset"
                , "border-radius" => "10px"
                ]
            ]
            [ div
                [ class "card-label"
                , style
                    [ "color" => "#2C3E50"
                    , "font-family" => "monospace"
                    , "font-size" => "3em"
                    ]
                ]
                [ text label ]
            ]
        ]
