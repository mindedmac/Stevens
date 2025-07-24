



let rec mirror_image (l: 'a list) : 'a list = 
  match l with
  | [] -> []
  | 2 :: tail -> 4 :: mirror_image tail
  | 3 :: tail -> 5 :: mirror_image tail
  | 4 :: tail -> 2 :: mirror_image tail
  | 5 :: tail -> 3 :: mirror_image tail
  | head :: tail -> head :: mirror_image tail



  let ninety (n: 'a) : 'a = 
    match n with
    | 0 | 1 -> n
    | 2 -> 3
    | 3 -> 4
    | 4 -> 5
    | 5 -> 2
    | _ -> failwith "Invalid input for ninety function"
  let rec rotate90_image (l: 'a list) : 'a list = 
    match l with
    | [] -> []
    | head :: tail -> ninety head :: rotate90_image tail
  
  
  
let rec repeat (n: int) (e: string) : string list =
  match n with 
  | 0 -> []
  | n -> e :: repeat (n - 1) e


    
let rec repeat' (n: int) (e: 'a) (acc: 'a list): 'a list =
  match n with 
  | 0 -> acc
  | n -> repeat' (n - 1) e (e::acc)


let rec pantograph (s: int) (l: int list) : int list =
  match l with
  | [] -> []
  | 0::tail 
  | 1::tail -> pantograph s tail
  | head :: tail -> repeat' s head [] @ pantograph s tail