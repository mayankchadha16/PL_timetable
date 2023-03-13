let rec read_list () =
  let input = read_line () in
    List.map int_of_string (String.split_on_char ';' input)

let read_from_txt_file filename = 
  let lines = ref [] in
  let chan = open_in filename in
  try
    while true; do
      lines := input_line chan :: !lines
    done; !lines
  with End_of_file ->
    close_in chan;
    List.rev !lines ;;

(* PREPROCESSING *)
(* ############################################################################################################## *)
  let invert_student_to_course (student, courses) =
    List.map (fun course -> (course, student)) courses
  
  let group_by_course acc (course, student) =
    let rec update_course = function
      | [] -> [(course, [student])]
      | (c, students) :: rest ->
        if c = course then (c, student :: students) :: rest
        else (c, students) :: update_course rest
    in
    update_course acc
  
  let course_to_student student_to_course =
    let inverted = List.map invert_student_to_course student_to_course |> List.concat in
    List.fold_left group_by_course [] inverted

(* ############################################################################################################## *)


(* INFERENCE GRAPH *)
(* ############################################################################################################## *)
  let has_common_students students1 students2 =
    List.exists (fun x -> List.mem x students2) students1

  let is_edge_valid course1 students1 course2 students2 =
    course1 < course2 && has_common_students students1 students2
  
  let create_inference_graph course_to_student_list =
    let edges = List.fold_left (fun acc (course1, students1) ->
      List.fold_left (fun acc' (course2, students2) ->
        if is_edge_valid course1 students1 course2 students2 then
          (course1, course2) :: acc'
        else
          acc'
          ) acc course_to_student_list
          ) [] course_to_student_list in
          edges
(* ############################################################################################################## *)


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
  aux [] nodes
(* ############################################################################################################## *)


(* PRINT TIMETABLE (Converter) *)
(* ############################################################################################################## *)
let get_courses_by_slot colored_graph slot =
  List.filter (fun (_, color) -> color = slot) colored_graph |> List.map fst

let format_slot slot courses =
  "|\tSlot " ^ string_of_int slot ^ " : " ^ String.concat ", " (List.map string_of_int courses)
  
let print_slot slot colored_graph =
  let courses = get_courses_by_slot colored_graph slot in
  let formatted_slot = format_slot slot courses in
  print_endline formatted_slot  

let print_timetable colored_graph =
  let slots = List.map snd colored_graph |> List.sort_uniq compare in
  List.iter (fun slot -> print_slot slot colored_graph) slots;;

let printer colored_graph= 
  print_endline "\n#############################################";
  print_endline "| Final TimeTable using the Scheduler:         ";
  print_endline "#############################################";
  print_timetable colored_graph;
  print_endline "#############################################\n"
(* ############################################################################################################## *)

(* INPUTS HERE *)
let list_of_courses = [1; 2; 3]
let list_of_students = [1; 2; 3]
let student_to_course = [(1, [1; 2]); (2, [2; 3]); (3, [1])]

let t1() = 
  let course_to_student_list = course_to_student student_to_course in
  let edge_list = create_inference_graph course_to_student_list in
  let colored_graph = color_nodes edge_list in
  printer colored_graph;;
  
t1()