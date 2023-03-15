(* PRINT TIMETABLE (Converter) *)
(* ############################################################################################################## *)
let get_courses_by_slot colored_graph slot =
  List.filter (fun (_, color) -> color = slot) colored_graph |> List.map fst

let format_slot slot courses =
  "|\tSlot " ^ string_of_int (slot+1) ^ " : " ^ String.concat ", " (List.map string_of_int courses)
  
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