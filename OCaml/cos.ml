let rec factorial i =
  match i with
  | 0 -> 1
  | n -> n * factorial (n - 1)
 
let func x k = ((Float.pow (-1.) k) *. (Float.pow x k)) /. float_of_int (factorial (2 * int_of_float k))
               
let rec cos acc x =
  match acc with
  | 0 -> 1.
  | n -> (func x (float_of_int acc)) +. (cos (acc - 1) x)
(* subtracts 1 at the end b/c faulty logic? if no 0 -> 1. then crash as no end to recursion.....*)
let cos' x = cos 20 x
let cos'' x = cos 31 x