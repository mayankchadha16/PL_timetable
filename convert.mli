(* PRINT TIMETABLE (Converter) *)
val get_courses_by_slot : ('a * 'b) list -> 'b -> 'a list
val format_slot : int -> int list -> string
val print_slot : int -> (int * int) list -> unit
val print_timetable : (int * int) list -> unit
val printer : (int * int) list -> unit