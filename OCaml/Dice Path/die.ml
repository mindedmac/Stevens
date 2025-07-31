type die = { top : int; down : int; left : int; right : int; front : int; back : int }

let roll_down die =
  { die with top = die.back; down = die.front; front = die.top; back = die.down }

let roll_right die =
  { die with top = die.left; down = die.right; left = die.down; right = die.top }

let init = {
  top = 1;
  down = 6;
  left = 3;
  right = 4;
  front = 2;
  back = 5;
}
let rec solve die down right =
  let rest = match down, right with
    | 1, 1 -> 0
    | 1, r -> solve (roll_right die) 1 (r - 1)
    | d, 1 -> solve (roll_down die) (d - 1) 1
    | d, r -> max (solve (roll_down die) (d - 1) r) (solve (roll_right die) d (r - 1))
  in rest + die.top

let get_max m n =
  let m' = if m < 4 then 0 else m / 4 - 1 in
  let n' = if n < 4 then 0 else n / 4 - 1 in
  let m'base = m - m'*4 and n'base = n - n'*4 in
  (m' + n') * 14 + solve init m'base n'base

