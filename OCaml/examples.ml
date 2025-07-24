
let rec factorial i =
  match i with
  | 0 -> 1
  | n -> n * factorial (n - 1)
 

  (* 
   Examples of recursion 
   22 July 2025 
*)


(* Recursion on numbers *)

let rec sum i =
  match i with
  | 0 -> 0
  | n -> n + sum (n-1)

let rec fact i =
  match i with
  | 0 -> 1
  | n -> n * fact (n-1)

let rec fact' i =
  if i=0
  then 1
  else i * fact' (i-1)

let rec repeat e i =
  match i with
  | 0 -> []
  | n -> e :: repeat e (n-1)

(** [init i] returns a list of all the numbers from 0 to [i], in that order.
    Precondition: [i] is positive
    Example: init 3 
             => 
             [0;1;2;3] *)
let rec init i =
  match i with 
  | 0 -> [0]
  | n -> init (n-1) @ [n]

let rec length (l:'a list) : int =
  match l with
  | [] -> 0
  | head :: tail -> 1 + length tail

let rec sum : int list -> int =
  fun l ->
  match l with
  | [] -> 0
  | head :: tail -> head + sum tail

let rec mem (e:'a) (l:'a list) : bool =
  match l with
  | [] -> false
  | head :: tail -> head = e || mem e tail

let rec rev (l:'a list) : 'a list =
  match l with
  | [] -> []
  | head :: tail -> rev tail @ [head]

let rec has_dupe (l:'a list) : bool = 
  match l with
  | [] -> false
  | head :: tail -> mem head tail || has_dupe tail

let rec andl (l:bool list) : bool =
  match l with
  | [] -> true
  | head :: tail -> head && andl tail 


let rec nth (l:'a list) (i: int) : 'a = 
  match i with
  | 0 -> List.hd l
  | i -> if i > length l 
    then failwith "out of bounds" 
    else nth (List.tl l) (i - 1)





let rec frev (l:'a list) (acc:'a list) : 'a list =
  match l with
  | [] -> acc
  | head :: tail -> frev tail (head :: acc) 








let succ i = i + 1
let upper c = Char.uppercase_ascii c
let isz i = i = 0
let is_pos i = i > 0
let is_upper c = Char.uppercase_ascii c = c
let is_ne l = l != []

(* 
   Examples of recursion on lists 
   22 July 2025*)


(*moldule schemes*)
(*
let rec succl l =
  match l with
  | [] -> []
  | head :: tail -> succ head :: succl tail 

let rec upperl l =
  match l with
  | [] -> []
  | head :: tail -> upper head :: upperl tail

let rec zerol l =
  match l with
  | [] -> []
  | head :: tail -> isz head :: zerol tail
  
  use List.map*)
let rec map (f: 'a -> 'b) (l: 'a list) : 'b list =
  match l with
  | [] -> []
  | head :: tail -> f head :: map f tail
let succl' l = map succ l
let upperl' l = map upper l
let zerol' l = map isz l
(*
let rec fgtz l =
  match l with
  | [] -> []
  | head :: tail -> if head > 0 then head :: fgtz tail else fgtz tail

let rec fupper l =
  match l with
  | [] -> []
  | head :: tail -> if Char.uppercase_ascii head = head then head :: fupper tail else fupper tail

let rec fne l =
  match l with
  | [] -> []
  | head :: tail -> if head != [] then head :: fne tail else fne tail*)

let rec filter (f: 'a -> bool) (l: 'a list) : 'a list = 
  match l with
  | [] -> []
  | head :: tail -> if f head then head :: filter f tail else filter f tail

let fgtz' l = filter (fun i -> i > 0) l
let fupper' l = filter is_upper l
let fne' l = filter is_ne l

let suml l = List.fold_right ( + ) l 0

let truel l = List.fold_right ( && ) l true

let concat l = List.fold_right ( @ ) l []

let rec fold_right' (f: 'a -> 'b -> 'b) (l: 'a list) (a: 'b) : 'b =
  match l with
  | [] -> a
  | head :: tail -> f head (fold_right' f tail a)

let rec fold_left' (f: 'a -> 'b -> 'a) (a: 'a) (l: 'b list) : 'a =
  match l with
  | [] -> a
  | head :: tail -> fold_left' f (f a head) tail


type dow = 
  | Mon
  | Tue
  | Wed
  | Thu
  | Fri
  | Sat
  | Sun

let is_weekend (d: dow) : bool =
  match d with
  | Sat | Sun -> true
  | _ -> false

let next d = 
  match d with
  | Mon -> Tue
  | Tue -> Wed
  | Wed -> Thu
  | Thu -> Fri
  | Fri -> Sat
  | Sat -> Sun
  | Sun -> Mon

type flavor = 
  | Vanilla
  | Chocolate
  | Strawberry

type ice_cream = 
  | Cone of flavor
  | Cup of flavor * flavor
  | Bucket of flavor list

let cost (ice: ice_cream) : float =
  match ice with
  | Cone _ -> 1.0
  | Cup (_, _) -> 2.0
  | Bucket flavors -> 1.0 +. (float (List.length flavors)) *. 0.5