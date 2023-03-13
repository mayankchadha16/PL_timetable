(* INFERENCE GRAPH *)
val has_common_students : 'a list -> 'a list -> bool
val is_edge_valid : 'a -> 'b list -> 'a -> 'b list -> bool
val create_inference_graph : ('a * 'b list) list -> ('a * 'a) list