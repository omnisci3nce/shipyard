let run () =
  let _config = Config.default () in
  Dream.run
  @@ Dream.logger
  @@ Dream.router [

    Dream.get "/:word"
      (fun request ->
        Dream.param request "word"
        |> Template.render
        |> Dream.html);

  ]
