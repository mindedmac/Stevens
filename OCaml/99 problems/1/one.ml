

let rec last (l:'a list) : 'a option = 
  match l with 
  | [] -> None
  | [x] -> Some x
  | head :: tail -> last tail

let rec frev (l:'a list) (acc:'a list) : 'a list =
  match l with
  | [] -> acc
  | head :: tail -> frev tail (head :: acc) 

let rec last' (l: 'a list) : 'a option =
  match l with 
  | [] -> None 
  | head :: tail -> Some (List.hd (frev l []))




(*real solution on OCaml*)
(* This function returns the last element of a list as an option type.
   If the list is empty, it returns None. Otherwise, it returns Some last. *)
let last'' (l: 'a list) : 'a option =
  match l with 
  | [] -> None
  | [x] -> Some x
  | _ :: tail -> last tail 

