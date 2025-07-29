

let rec frev (l:'a list) (acc:'a list) : 'a list =
  match l with
  | [] -> acc
  | head :: tail -> frev tail (head :: acc) 


let is_palindrome l =
  match l with
  | [] -> true
  | head :: tail -> frev l [] = l
  

let rec is_palindrome' l acc =
  match l with
  | [] -> acc = []
  | head :: tail -> is_palindrome' tail (head :: acc)


(*OCaml best solution*)
let is_palindrome'' list = list = List.rev list