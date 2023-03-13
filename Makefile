app : timetable.cmo preprocessing.cmo inference.cmo coloring.cmo convert.cmo user_input.cmo
	ocamlc -o app user_input.cmo preprocessing.cmo inference.cmo coloring.cmo convert.cmo timetable.cmo 

user_input.cmo : user_input.ml user_input.cmi
	ocamlc -c user_input.ml

user_input.cmi : user_input.mli
	ocamlc -c user_input.mli

preprocessing.cmo : preprocessing.ml preprocessing.cmi
	ocamlc -c preprocessing.ml

preprocessing.cmi : preprocessing.mli
	ocamlc -c preprocessing.mli

inference.cmo : inference.ml inference.cmi
	ocamlc -c inference.ml

inference.cmi : inference.mli
	ocamlc -c inference.mli

coloring.cmo : coloring.ml coloring.cmi
	ocamlc -c coloring.ml

coloring.cmi : coloring.mli
	ocamlc -c coloring.mli

convert.cmo : convert.ml convert.cmi
	ocamlc -c convert.ml

convert.cmi : convert.mli
	ocamlc -c convert.mli

timetable.cmo : timetable.ml timetable.cmi 
	ocamlc -c timetable.ml

timetable.cmi : timetable.mli user_input.cmi preprocessing.cmi inference.cmi coloring.cmi convert.cmi 
	ocamlc -c timetable.mli

clean :
	rm *.cmo *.cmi app