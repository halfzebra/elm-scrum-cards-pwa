module View.Flip exposing (view)

import Html exposing (Html, div)
import Html.Attributes exposing (class, classList)


view : Bool -> List (Html msg) -> List (Html msg) -> Html msg
view flag front back =
    div
        [ class "flip-container"
        , classList [ ( "hover", flag ) ]
        ]
        [ div
            [ class "flipper" ]
            [ div
                [ class "front" ]
                [ div
                    [ class "deck" ]
                    front
                ]
            , div [ class "back" ] back
            ]
        ]
