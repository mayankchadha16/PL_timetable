let list_of_students = [1;2;3]
let list_of_courses = [1;2;3]

let student_to_course = [(1, [1; 2]); (2, [2; 3]); (3, [1])]


(* PREPROCESSING *)
(* ############################################################################################################## *)

  let invert_student_to_course (student, courses) =
    List.map (fun course -> (course, student)) courses
  
  let group_by_course acc (course, student) =
    let students = match List.assoc_opt course acc with
    | Some students -> students
    | None -> []
  in
  (course, student :: students) :: List.remove_assoc course acc
  
  let course_to_student student_to_course =
    let inverted = List.map invert_student_to_course student_to_course |> List.concat in
    List.fold_left group_by_course [] inverted

(* ############################################################################################################## *)


(* INFERENCE GRAPH *)
(* ############################################################################################################## *)

  let create_inference_graph course_to_student_list =
    let edges = List.fold_left (fun acc (course1, students1) ->
      List.fold_left (fun acc' (course2, students2) ->
        if course1 < course2 && List.exists (fun x -> List.mem x students2) students1 then
          (course1, course2) :: acc'
        else
          acc'
          ) acc course_to_student_list
          ) [] course_to_student_list in
          List.rev edges

(* ############################################################################################################## *)

(* TESTED WORKING *)
(* let course_to_student_list = course_to_student student_to_course
let edge_list = create_inference_graph course_to_student_list *)

(* CHAINTIN YET TO BE IMPLEMENTED *)
let colored_graph = [(1, 0); (2, 1); (3, 0)]

(* ############################################################################################################## *)


(* PRINT TIMETABLE (Converter) *)
(* ############################################################################################################## *)

  let print_timetable colored_graph =
    let slots = List.map snd colored_graph |> List.sort_uniq compare in
    List.iter (fun slot ->
      (* Filter out the courses that belong to the current slot *)
      let courses = List.filter (fun (_, color) -> color = slot) colored_graph |> List.map fst in
      Printf.printf "|\tSlot %d: %s\n" slot (String.concat ", " (List.map string_of_int courses))
    ) slots;;

(* ############################################################################################################## *)
print_endline "#############################################";;
print_endline "| Final TimeTable using the Scheduler:\t";;
print_timetable colored_graph;;
print_endline "#############################################";;