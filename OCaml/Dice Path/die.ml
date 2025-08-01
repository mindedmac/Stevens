type die = {
  top : int; 
  bottom : int; 
  left : int; 
  right : int; 
  front : int; 
  back : int
}

let roll_down die = {
  die with top = die.back; 
  bottom =die.front; 
  front = die.top; 
  back = die.bottom 
}
let roll_right die = {
  die with top = die.left; 
  bottom = die.right; 
  left = die.bottom; 
  right = die.top
}
let init = {
  top = 1;
  bottom = 6;
  left = 3;
  right = 4;
  front = 2;
  back = 5;
}
let rec solve die down right =
  let path = match down, right with
    | 1, 1 -> 0
    | 1, r -> solve (roll_right die) 1 (r - 1) (*only going right - one path*)
    | d, 1 -> solve (roll_down die) (d - 1) 1 (*only going own - one path*)
    | d, r -> max (solve (roll_down die) (d - 1) r) (solve (roll_right die) d (r - 1))
  in path + die.top (*add top to the maxpath taken*)

let get_max x y =
  let m = if x < 4 
    then 0 
    else x / 4 - 1 in
  let n = if y < 4 
    then 0 
    else y / 4 - 1 in
  let m' = x - m * 4 in
  let n' = y - n * 4 in

  ((m + n) * 14) + solve init m' n'

let () = 
    let n = int_of_string (read_line ()) in
    let coord = ref [] in
      for _ = 1 to n do
        coord := !coord @ (List.map int_of_string ((String.split_on_char ' ') (read_line()))) 
      done;
      for i = 0 to n - 1 do
        let m, n = List.nth !coord (i * 2), List.nth !coord (i * 2 + 1) in
        let max_value = get_max m n in
        print_endline (string_of_int max_value)
      done
      

