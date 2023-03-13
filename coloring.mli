(* GRAPH COLORING *)
val adj_nodes : ('a * 'a) list -> 'a -> 'a list
val adj_colors : ('a * 'b) list -> ('a * 'a) list -> 'a -> 'b list
val first_unused_color : int list -> int
val color_nodes : ('a * 'a) list -> ('a * int) list