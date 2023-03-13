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