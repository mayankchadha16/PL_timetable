
(* PREPROCESSING *)
val invert_student_to_course : 'a * 'b list -> ('b * 'a) list
val group_by_course : ('a * 'b list) list -> 'a * 'b -> ('a * 'b list) list 
val course_to_student : ('a * 'b list) list -> ('b * 'a list) list

(* INFERENCE GRAPH *)
val create_inference_graph : ('a * 'b list) list -> ('a * 'a) list

(* PRINT TIMETABLE (Converter) *)
val print_timetable : (int * int) list -> unit