


(* Die state representation:
   mface: [front; bottom; back; top]
   nface: [front; right; back; left]
   position: (row, col)
   top: current top face value
   bottom: current bottom face value *)

  let mface = ref [1; 2; 6; 5]
  let nface = ref [1; 4; 6; 3]
  let position = ref (1, 1)
  let top = ref (List.nth !mface 3)  (* Initialize with actual top value *)
  let bottom = ref (List.nth !mface 1)  (* Initialize bottom *)
  
  let down () =
    match (!mface, !nface) with
    | [m0; m1; m2; m3], [n0; n1; n2; n3] ->
        mface := [m1; m2; m3; m0];
        nface := [m1; n1; m3; n3];
        position := (fst !position + 1, snd !position);
        top := m0;    
        bottom := m2 
    | _ -> failwith "Invalid die state"
  
  let right () =
    match (!mface, !nface) with
    | [m0; m1; m2; m3], [n0; n1; n2; n3] ->
        mface := [n1; m1; n3; m3];
        nface := [n1; n2; n3; n0];
        position := (fst !position, snd !position + 1);
        bottom := m1  
    | _ -> failwith "Invalid die state"