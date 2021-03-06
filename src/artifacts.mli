open! Import

type t

val create : Context.t -> (Path.t * Jbuild_types.Stanza.t list) list -> t

(** A named artifact that is looked up in the PATH if not found in the tree or
    [in_the_tree] is [false].

    If the name is an absolute path, it is used as it.
*)
val binary
  :  t
  -> ?hint:string
  -> ?in_the_tree:bool (* default true *)
  -> string
  -> (Path.t, fail) result

(** [file_of_lib ?use_provides t ~from name] a named artifact that is looked up in the
    given library.

    [name] is expected to be of the form "<lib>:<file>". Raises immediately if it is not
    the case. Returns "<lib>" as well as the resolved artifact.
*)
val file_of_lib
  :  t
  -> ?use_provides:bool
  -> from:Path.t
  -> string
  -> string * (Path.t, fail) result
