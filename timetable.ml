let list_of_students = [1;2;3]
let list_of_courses = [1;2;3]

let student_to_course = [(1, [1; 2]); (2, [2; 3]); (3, [1])]

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
