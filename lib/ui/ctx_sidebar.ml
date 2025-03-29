(** Contextual sidebar

Sidebar is always in the same location but displays different
links based on what page you're on. *)

type sidebar = [
  | `Home
  | `Repo of Git.Lib.repo
  | `Settings
]

type nav_item = {
  text: string;
  href: string;
  icon: string option;
}

let nav_items (sbar: sidebar) : nav_item list = let open Printf in
  match sbar with
  | `Home -> [
      { text = "Repos"; href = "/"; icon = None };
      { text = "About"; href = "" (* TODO: customisable About (company, person, instance) page *); icon = None };
      { text = "Latest Activity"; href = "" (* TODO *); icon = None }
    ]
  | `Repo r -> 
      let after_repo_url = (fun s -> sprintf "/%s/%s" r.name s ) in
      [
      { text = "Branches";  href = after_repo_url "branches"; icon = None };
      { text = "Commits";   href = after_repo_url "commits";  icon = None };
      { text = "Tags";      href = after_repo_url "tags";     icon = None }
      ]
  | `Settings -> []