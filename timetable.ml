(* PROVIDE/ALTER INPUTS HERE *)


let [@warning "-26"] t1() = 
  let list_of_courses = [1; 2; 3] in
  let list_of_students = [1; 2; 3] in
  let student_to_course = [(1, [1; 2]); (2, [2; 3]); (3, [1])] in
  let course_to_student_list = Preprocessing.course_to_student student_to_course in
  let edge_list = Inference.create_inference_graph course_to_student_list in
  let colored_graph = Coloring.color_nodes edge_list in
  Convert.printer colored_graph;;
  
t1()

let [@warning "-26"] t2() = 
  let list_of_courses = [1; 2; 3] in
  let list_of_students = [1; 2; 3] in
  let student_to_course = [(1, [1; 2]); (2, [2; 3]); (3, [1; 3])] in
  let course_to_student_list = Preprocessing.course_to_student student_to_course in
  let edge_list = Inference.create_inference_graph course_to_student_list in
  let colored_graph = Coloring.color_nodes edge_list in
  Convert.printer colored_graph;;
  
t2()

let [@warning "-26"] t3() = 
  let list_of_courses = [1; 2; 3] in
  let list_of_students = [1; 2; 3; 4; 5] in
  let student_to_course = [(1, [1; 3]); (2, [1; 2]); (3, [1; 2]); (4, [2]); (5, [3])] in
  let course_to_student_list = Preprocessing.course_to_student student_to_course in
  let edge_list = Inference.create_inference_graph course_to_student_list in
  let colored_graph = Coloring.color_nodes edge_list in
  Convert.printer colored_graph;;
  
t3()