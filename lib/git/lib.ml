
type repo = {
  name: string;
}

(** Extended repository info *)
type repo_ext = {
  tags: string list;
}

let all_repos () : (repo list) Lwt.t =
  let path = Fpath.v "/home/joshua/code/shipyard" in
  let%lwt state_result = Git_unix.Store.v path in
  let state = Result.get_ok state_result in (* TODO: error handling *)
  let%lwt objects = Git_unix.Store.list state in

  Printf.printf "Num objects: %d\n" (List.length objects);

  List.iter (fun (obj: Digestif.SHA1.t) -> Printf.printf "%s\n" (Git_unix.Store.Hash.to_hex obj)) objects;
  flush stdout;
  (* as an example lets just list git objects *)

  Lwt.return [
    {name = "celeritas-core"}; 
    {name = "celeritas-additions"}; 
    {name = "celeritas-editor"}
  ] 

let get_extended_info _store : repo_ext list = failwith "TODO"