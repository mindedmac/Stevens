
(*my solution*)
(* This function returns the last element of a list as an option type.
   If the list is empty, it returns None. Otherwise, it returns Some last. *)
let rec at n l : 'a option =
    match n with
    | 0 -> (match l with
             | [] -> None
             | x :: _ -> Some x)
    | n -> (match l with
             | [] -> None
             | _ :: tail -> at (n - 1) tail)


(*real solution on OCaml*)
(* This function returns the nth element of a list as an option type.*)
let rec at' k = function
| [] -> None
| h :: t -> if k = 0 then Some h else at (k - 1) t

let rec at'' n l : 'a option =
  match n, l with
  | 0, x :: _ -> Some x
  | _, [] -> None
  | n, _ :: tail -> at'' (n - 1) tail


(*builtin function*)
let at''' l n : 'a option = List.nth l n 
