import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

main = Html.beginnerProgram { model = model, view = view, update = update }

-- MODEL

type alias Model =
  { name: String,
    password: String,
    passwordAgain: String }

model: Model
model =
  Model "" "" ""

-- UPDATE

type Msg =
  Name String
  | Password String
  | PasswordAgain String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Name newContent ->
      { model | name = newContent }

    Password newContent ->
      { model | password = newContent }

    PasswordAgain newContent ->
      { model | passwordAgain = newContent }

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ type_ "text", placeholder "Name", onInput Name] []
    , input [ type_ "password", onInput Password] []
    , input [ type_ "password", onInput PasswordAgain] []
    , viewValidation model
    ]

viewValidation : Model -> Html msg
viewValidation model =
  let
    (color, message) =
      if String.length model.password > 8 then
        if model.password == model.passwordAgain then
          ("green", "OK")
        else
          ("red", "Passwords do not match")
      else
        ("red", "Password too short")
  in
    div [ style [("color", color)] ] [ text message ]
