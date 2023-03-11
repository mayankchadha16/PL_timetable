app : timetable.cmo
	ocamlc -o app timetable.cmo 

timetable.cmo : timetable.ml timetable.cmi
	ocamlc -c timetable.ml

timetable.cmi : timetable.mli
	ocamlc -c timetable.mli

clean :
	rm *.cmo *.cmi app