type repo = {
  name: string;
}

let all_repos () : repo list =
  (* TODO: fetch by actually scanning a directory *)
  [
    {name = "celeritas-core"}; 
    {name = "celeritas-additions"}; 
    {name = "celeritas-editor"}
  ] 