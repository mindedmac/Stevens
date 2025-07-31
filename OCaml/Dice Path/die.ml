

let mface = ref [|5; 6; 2; 1|]  (* [back; bottom; front; top] *)
let nface = ref [|3; 6; 4; 1|] 
let position = ref (1, 1)
let top = ref 1
let bottom = ref 6

let down () =
  let om = !mface in
  let on = !nface in
  mface := [| om.(1); om.(2); om.(3); om.(0) |];
  nface := [| om.(0); on.(3); om.(2); on.(1) |];
  position := (fst !position + 1, snd !position);
  top := !mface.(3);
  bottom := !mface.(1)

let right () =
  let om = !mface in
  let on = !nface in
  mface := [| om.(0); on.(2); om.(2); on.(0) |];
  nface := [| on.(1); on.(2); on.(3); on.(0) |];
  position := (fst !position, snd !position + 1);
  top := !mface.(3);
  bottom := !mface.(1)

