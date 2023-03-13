(* NOT USED AS MENTIONED IN README.MD *)

let rec read_list () =
  let input = read_line () in
    List.map int_of_string (String.split_on_char ';' input)

let read_from_txt_file filename = 
  let lines = ref [] in
  let chan = open_in filename in
  try
    while true; do
      lines := input_line chan :: !lines
    done; !lines
  with End_of_file ->
    close_in chan;
    List.rev !lines ;;