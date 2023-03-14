module MyStack :
  sig
    type 'a stack = Null | Element of 'a * 'a stack
    val empty : 'a stack
    val push : 'a -> 'a stack -> 'a stack
    val top : int stack -> int
    val pop : 'a stack -> 'a stack
    val isempty : 'a stack -> bool
    val ispresent : 'a -> 'a stack -> bool
  end
val degree : ('a * 'a) list -> 'a -> int
val exclude_node : ('a * 'a) list -> 'a -> ('a * 'a) list
val insert_stack :
  ('a * 'a) list -> 'a MyStack.stack -> int -> 'a MyStack.stack
val complete_stack : ('a * 'a) list -> 'a MyStack.stack -> 'a MyStack.stack
val isNeighbour : ('a * 'a) list -> 'a -> 'a -> bool
val checkisNeighbour : ('a * 'a) list -> 'a -> 'a -> bool
val max : 'a -> 'a -> 'a
val min : 'a -> 'a -> 'a
val node_list : 'a MyStack.stack -> 'a list -> 'a list
val inner_loop : ('a * 'b) list -> ('a * 'a) list -> 'a -> 'b -> bool
val outer_loop2 : ('a * int) list -> ('a * 'a) list -> 'a -> int -> int -> int
val chaitin_2 :
  'a list -> ('a * int) list -> ('a * 'a) list -> int -> int -> ('a * int) list
val chaitin : ('a * 'a) list -> int -> int -> ('a * int) list