(* Stack Module *)
(* ############################################################################################################## *)
module MyStack = struct 
  type 'a stack = 
   | Null
   | Element of 'a * 'a stack
 
  let empty = Null
 
  let push x s = 
   Element (x ,s)
 
  let top = function
   | Null -> -1
   | Element (x, _) -> x
 
  let pop = function
   | Null -> failwith "Null"
   | Element (_, s) -> s
 
   let isempty = function
   | Null -> true
   | Element (_, _) -> false
 
   let rec ispresent x s= 
     match s with 
    Null -> false
   | Element(a, b) ->
     if a = x then true
     else
       ispresent x b
  
 end
 (* ############################################################################################################## *)
 
 (* Stack Implementation *)
 (* ############################################################################################################## *)
 (* Check the Degree of Node *)
 let degree edge_list node = 
   let rec degree_loop edge_list node acc = 
     match edge_list with
     [] -> acc
     | (a, b) :: t -> 
       if (a = node || b = node) then
         degree_loop t node (acc+1)
       else
         degree_loop t node acc
   in 
    degree_loop edge_list node 0;;
 
 (* Intermediate function to delete edges from edge_list*)
 let rec exclude_node list node = 
   match list with
   [] -> []
   | (a, b) :: t -> 
     if ((a = node) || (b = node)) then exclude_node t node
     else (a, b) :: exclude_node t node
 
 (* Pushing into the Stack by selecting Nodes with degree less than k*)    
 let rec insert_stack edge_list stk k = 
   match edge_list with
   [] -> stk
   | (u, v) :: t -> 
     if ((degree edge_list u) < k) then
       insert_stack (exclude_node t u) (MyStack.push u stk) k
     else if ((degree edge_list v) < k) then
       insert_stack (exclude_node t v) (MyStack.push v stk) k
     else
       insert_stack (t @ [(u,v)]) stk k
 
 (* Pushing remaining nodes into the Stack*)       
 let rec complete_stack edge_list stk =
   match edge_list with
   [] -> stk
   | (a, b) :: t -> 
     if ((not (MyStack.ispresent a stk)) && (not (MyStack.ispresent b stk))) then
       complete_stack t (MyStack.push b (MyStack.push a stk))
     else if (not (MyStack.ispresent a stk)) then
       complete_stack t (MyStack.push a stk)
     else if (not (MyStack.ispresent b stk)) then
       complete_stack t (MyStack.push b stk)
     else
       complete_stack t stk;;
 
 (* ############################################################################################################## *)
 
 (* INTERMEDIATE FUNCTIONS*)
 (* ############################################################################################################## *)
 (* Is Neighbour function*)
 let rec isNeighbour edge_list node a =  
   match edge_list with 
   [] -> false
   | (x, y) :: t -> 
     if ((x = node && y = a) || (x = a && y = node)) then 
       true
     else
       isNeighbour t node a 
 
 let checkisNeighbour edge_list node a = not (isNeighbour edge_list node a);;
 
 (* Maximum Minimum function*)
 let max a b = 
   if(a > b) then a
   else 
     b;;
 
 let min a b = 
   if(b > a) then a
   else
     b;;
 
 (* Converting Stack into List *)
 let node_list stk list = 
   let rec stack_to_list stk list = 
     match stk with
     MyStack.Null -> list
     | Element(x, s) -> stack_to_list s (x :: list)
   in
     List.rev (stack_to_list stk list);;
 
   
 (* ############################################################################################################## *)
 
 (* COLORING OF GRAPH*)
 (* ############################################################################################################## *)
 let rec inner_loop color_list edge_list node color= 
   match color_list with
   [] -> true
   | (u,v) :: t -> 
     if v = color then 
       checkisNeighbour edge_list node u
     else 
       inner_loop t edge_list node color
   
 let rec outer_loop2 color_list edge_list node color k =
   if(color = k) then 
     k
   else
     if(inner_loop color_list edge_list node color) then
       color
     else
       outer_loop2 color_list edge_list node (color+1) k 
 
 let rec chaitin_2 node_list color_list edge_list color k = 
   match node_list with
   [] -> color_list
   | h :: t -> chaitin_2 t ((h, outer_loop2 color_list edge_list h color k)::color_list) edge_list color k
 
 (* ############################################################################################################## *)
 
 (* FINAL CHAITIN*)
 (* ############################################################################################################# *)
 
 (* k is k-coloring and s is choose to start with 0 or 1 as the first interval*)
 let chaitin edge_list k s= 
   let temp_edge_list = edge_list in
   let stk = MyStack.Null         in
   let stck = insert_stack temp_edge_list stk k in
   let stck2 = complete_stack edge_list stck in
   let nl = node_list stck2 [] in
   let final_coloring_ans = chaitin_2 nl [] edge_list s k in
   final_coloring_ans
 ;;
 
 (* TEST CASES*)
 (* ############################################################################################################# *)
 
 let edge_list1 = [(2, 3); (1, 2)];;
 let edge_list2 = [(1,2);(1,3);(2,5);(3,5);(3,4)];;
 let edge_list3 = [(1,6);(1,3);(2,5);(2,3);(2,6);(3,4);(3,5);(3,6);(4,5);(4,6);(5,6)];;
 
 let test1 = chaitin edge_list1 2 0;; 
 let test2 = chaitin edge_list2 3 0;; 
 let test3 = chaitin edge_list3 4 1;; 
 
 (* ############################################################################################################# *)
 (* ############################################################################################################# *)
 