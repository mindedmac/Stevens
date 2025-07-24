

(*8solution to problem 2*)

(* Find the last two (last and penultimate) elements of a list. *)

(* This function returns the last two elements of a list as an option type.
   If the list has fewer than two elements, it returns None. Otherwise, it
   returns Some (last, penultimate). *)
let rec last_two (l: 'a list) : ( 'a * 'a ) option =
  match l with
  | [] | [_] -> None
  | [x; y] -> Some (x, y)
  | _ :: tail -> last_two tail

