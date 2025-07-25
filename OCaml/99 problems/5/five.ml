


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
