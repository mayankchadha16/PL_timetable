app : timetable.cmo preprocessing.cmo inference.cmo coloring.cmo convert.cmo
	ocamlc -o app preprocessing.cmo inference.cmo coloring.cmo convert.cmo timetable.cmo 

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

timetable.cmi : timetable.mli preprocessing.cmi inference.cmi coloring.cmi convert.cmi
	ocamlc -c timetable.mli

clean :
	rm *.cmo *.cmi app