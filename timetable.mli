val read_list : unit -> int list 
val read_from_txt_file : string -> string list

(* PREPROCESSING *)
val invert_student_to_course : 'a * 'b list -> ('b * 'a) list
val group_by_course : ('a * 'b list) list -> 'a * 'b -> ('a * 'b list) list
val course_to_student : ('a * 'b list) list -> ('b * 'a list) list

(* INFERENCE GRAPH *)
val has_common_students : 'a list -> 'a list -> bool
val is_edge_valid : 'a -> 'b list -> 'a -> 'b list -> bool
val create_inference_graph : ('a * 'b list) list -> ('a * 'a) list

(* GRAPH COLORING *)
val adj_nodes : ('a * 'a) list -> 'a -> 'a list
val adj_colors : ('a * 'b) list -> ('a * 'a) list -> 'a -> 'b list
val first_unused_color : int list -> int
val color_nodes : ('a * 'a) list -> ('a * int) list

(* PRINT TIMETABLE (Converter) *)
val get_courses_by_slot : ('a * 'b) list -> 'b -> 'a list
val format_slot : int -> int list -> string
val print_slot : int -> (int * int) list -> unit
val print_timetable : (int * int) list -> unit
val printer : (int * int) list -> unit


val t1 : unit -> unit