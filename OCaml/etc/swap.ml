

(* https://www.hackerrank.com/challenges/swap-nodes/problem *)

type node = { mutable data:int;
              mutable left: node option;
              mutable right: node option}

let rec string_of_tree no =
  match no with
  | None -> "None"
  | Some n ->
    "Node("^string_of_int n.data^","^string_of_tree n.left^","^string_of_tree n.right^")"

let leaf i = Some { data = i; left= None;right=None}
let rec build ts ns = 
  match ts, ns with
  | [],_ -> ()
  | (Some n)::tsTail, (-1)::(-1)::nsTail -> build tsTail nsTail 
  | (Some n)::tsTail, (-1)::j::nsTail -> 
    begin
      n.right <- leaf j;
      build (tsTail@[n.right]) nsTail
    end
  | (Some n)::tsTail, i::(-1)::nsTail -> 
    begin
      n.left <- leaf i;
      build (tsTail@[n.left]) nsTail
    end
  | (Some n)::tsTail, i::j::nsTail -> 
    begin
      if i > 0 then n.left <- leaf i;
      if j > 0 then n.right <- leaf j;
      build (tsTail @ [n.left; n.right]) nsTail
    end
  | (_,_) -> failwith "Invalid input for build function"



let rec build_tree ts ns =
   failwith "implement"

let read_file filename = 
  let lines = ref [] in
  let chan = open_in filename in
  try
    while true do
      lines := input_line chan :: !lines
    done;
    !lines
  with End_of_file ->
    close_in chan;
    List.rev !lines

let from_file ()=
  let input = read_file "test01.txt"
  in let no_of_nodes = int_of_string (List.nth input 0) in
  let xs = ref [] in
  for i= 1 to no_of_nodes do
    xs := !xs @ (List.map int_of_string ((String.split_on_char ' ') ((List.nth input i))))
  done;
  let tree= Some { data=1; left=None; right=None} in
  print_endline (string_of_tree tree)


let from_kbd ()=
  let no_of_nodes = int_of_string (read_line()) in
  let xs = ref [] in
  for i= 1 to no_of_nodes do
    xs := !xs @ (List.map int_of_string ((String.split_on_char ' ') (read_line())))
  done;
  let tree= Some { data=1; left=None; right=None} in
  (* build_tree [tree] !xs; *)
  print_endline (string_of_tree tree)
(*   (\*print_tree @@ Node(1,r1,r2)*\) *)
(*   let no_of_swaps=int_of_string (read_line()) *)
(*   in *)
(*   for i = 1 to no_of_swaps do *)
(*     let d=read_int() in *)
(*     tree:= swap_tree d tree d; *)
(*     print_string @@ (print_tree_io (!tree))^"\n" *)
(* done *)
