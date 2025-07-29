


(*  █  *)
type rect = {
  x: int;
  y: int;
  w: int;
  h: int;
}

let create_triangle mat rect =
  for y = 0 to (rect.h - 1) do
    for x = (rect.w/2 - y) to (rect.w/2 + y)do
      mat.(rect.y + y).(rect.x + x) <- "█";
    done
  done


(* print utility *)
let print_matrix printer mat = 
  Array.iter (
    fun row -> Array.iter (
      fun e -> printer e; print_string "";
    ) row; print_newline ()
  ) mat


(* helper functions *)
let upper_rect rect =
  let w' = rect.w/2 in
  let h' = rect.h/2 in
  {
    x = rect.x + w'/2 + 1;
    y = rect.y; 
    w = w';
    h = h';
  }

let left_rect rect =
  let w' = rect.w/2 in
  let h' = rect.h/2 in
  {
    x = rect.x;
    y = rect.y + h'; 
    w = w';
    h = h';
  }

let right_rect rect =
  let w' = rect.w/2 in
  let h' = rect.h/2 in
  {
    x = rect.x + w' + 1;
    y = rect.y + h'; 
    w = w';
    h = h';
  }


(* sierpinkski fractal algorithm *)
let sierpinkski_fractal ~size ~iteration =
  let height = int_of_float (2.0 ** float_of_int size) in
  let width = (height * 2) - 1 in
  let grid = Array.make_matrix height width "_" in
  let init = {x = 0; y = 0; w = width; h = height} in
  let grid_create_triangle = grid |> create_triangle in
  let rec aux r itr =
    match itr with
    | i when i = iteration -> grid_create_triangle r
    | i ->
        begin
          aux (upper_rect r) (i + 1);
          aux (left_rect r) (i + 1);
          aux (right_rect r) (i + 1)
        end
  in aux init 0;
  grid


(* main *)
let iter = stdin |> input_line |> int_of_string
let () = sierpinkski_fractal ~size:10 ~iteration:iter |> print_matrix print_string