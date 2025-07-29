



let nface: int list = [1;3;6;4]
let mface: int list = [1;2;6;5]
let position = (1, 1)
let top = 1


(*

let go (l: int list) (pos: int * int) =
  match pos with
  | (m, n) when (m = fst position) && (n = snd position) -> 
  | (m,n) when (m >= 1) && (n >= 1) && (m + n <= 120) -> 
  | (_,_) -> failwith "Invalid position"

*)



let rec right (n: int) =
  for i = 1 to n do
    let new_top = List.nth nface (top - 1)
    let new_pos = (fst position, snd position + 1)
    go nface new_pos
  done

let rec down (n: int) =
  for i = 1 to n do
    let new_top = List.nth mface (top - 1)
    let new_pos = (fst position + 1, snd position)
    go mface new_pos
  done

