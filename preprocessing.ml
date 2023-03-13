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
