


let rec length (l: 'a list) : int =
  match l with
  | [] -> 0
  | _ :: tail -> 1 + length tail



  (*OCaml solution, tail recursive*)
  let length list =
    let rec aux n = function
      | [] -> n
      | _ :: t -> aux (n + 1) t
  in aux 0 list;;