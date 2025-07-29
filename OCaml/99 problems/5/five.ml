


(*original slow reverse*)
let rec rev (l:'a list) : 'a list =
  match l with
  | [] -> []
  | head :: tail -> rev tail @ [head]

(*tail recursive reverse*)
let rec frev (l:'a list) (acc:'a list) : 'a list =
  match l with
  | [] -> acc
  | head :: tail -> frev tail (head :: acc) 


(*OCaml solution*)

let rev list =
  let rec aux acc = function
    | [] -> acc
    | h :: t -> aux (h :: acc) t
  in
  aux [] list;;