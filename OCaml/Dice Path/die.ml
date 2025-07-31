let mface = ref [|5; 6; 2; 1|]  (* [front; bottom; back; top] *)
let nface = ref [|2; 4; 5; 3|]  (* [front; right; back; left] *)
let position = ref (1, 1)
let top = ref 1
let bottom = ref 6

let down () =
  let om = !mface in
  mface := [| om.(1); om.(2); om.(3); om.(0) |];
  nface := [| !mface.(0); !nface.(1); !mface.(2); !nface.(3) |];
  position := (fst !position + 1, snd !position);
  top := !mface.(3);
  bottom := !mface.(1)

let right () =
  let om = !mface in
  let on = !nface in
  mface := [| om.(0); on.(1); om.(2); on.(3) |];
  nface := [| on.(0); om.(3); on.(2); om.(1) |];
  position := (fst !position, snd !position + 1);
  top := !mface.(3);
  bottom := !mface.(1)

  