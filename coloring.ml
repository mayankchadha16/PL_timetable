(* GRAPH COLORING *)
(* ############################################################################################################## *)
let adj_nodes e n =
  List.fold_left
    (fun acc (x, y) -> if x = n then y :: acc else if y = n then x :: acc else acc) [] e

let adj_colors output e n =
  List.fold_left
    (fun acc node -> 
      match List.assoc_opt node output with
      | Some color -> color :: acc
      | None -> acc) [] (adj_nodes e n)

let first_unused_color used_colors =
  let rec aux c =
    if List.mem c used_colors then aux (c + 1) else c
  in
  aux 0

let color_nodes e =
  let nodes = List.sort_uniq compare (List.flatten (List.map (fun (x, y) -> [x; y]) e)) in
  let rec aux output remaining =
    match remaining with
    | [] -> output
    | n :: ns ->
      let used_colors = adj_colors output e n in
      let new_color = first_unused_color used_colors in
      aux ((n, new_color) :: output) ns
  in
  List.rev (aux [] nodes)
(* ############################################################################################################## *)