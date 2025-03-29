open Ui
open Gitt.Lib

let run () =
  let _config = Config.default () in
  Dream.run
  @@ Dream.logger
  (* @@ Dream.livereload *)
  @@ Dream.router [
    Dream.get "/static/**" (Dream.static "./static");
    Dream.get "/r/:repo" (fun req ->
      let repo = { name =  Dream.param req "repo" } in
      Repo.render repo
      |> Layout.render ~title:"Shipyard" ~sidebar:(`Repo repo)
      |> Dream.html);
    Dream.get "/" 
      (fun _req ->
        let%lwt repos = Gitt.Lib.all_repos () in
        Index.render repos 
        |> Layout.render ~title:"Shipyard" ~sidebar:`Home
        |> Dream.html);
  ]
