type t = {
  (** Directory to scan for git repositories *)
  scan_dir: string;
}

(* unit -> t *)
let default () : t =
  { scan_dir = "/Users/josh/zenchi/"}
