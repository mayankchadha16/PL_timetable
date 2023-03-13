(* PROVIDE/ALTER INPUTS HERE *)
let list_of_courses = [1; 2; 3]
let list_of_students = [1; 2; 3]
let student_to_course = [(1, [1; 2]); (2, [2; 3]); (3, [1])]

let t1() = 
  let course_to_student_list = Preprocessing.course_to_student student_to_course in
  let edge_list = Inference.create_inference_graph course_to_student_list in
  let colored_graph = Coloring.color_nodes edge_list in
  Convert.printer colored_graph;;
  
t1()