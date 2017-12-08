# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	Facultad.find_or_create_by(nombre: "", cant_questions: 0)
	Facultad.find_or_create_by(nombre: "Ingenieria" ,cant_questions: 0)
	Facultad.find_or_create_by(nombre: "Veterinaria" ,cant_questions: 0)
	Facultad.find_or_create_by(nombre: "Ciencias Economicas" ,cant_questions: 0)
	Facultad.find_or_create_by(nombre: "Informatica" ,cant_questions: 0)
	Facultad.find_or_create_by(nombre: "Medicina" ,cant_questions: 0)	

	Tag.find_or_create_by(nombre: "Fisica", borrado: false)
	Tag.find_or_create_by(nombre: "Matematica", borrado: false)
	Tag.find_or_create_by(nombre: "Quimica", borrado: false)
	Tag.find_or_create_by(nombre: "Programacion", borrado: false)
	Tag.find_or_create_by(nombre: "Software", borrado: false)
	Tag.find_or_create_by(nombre: "Estadistica", borrado: false)
	Tag.find_or_create_by(nombre: "Arquitectura", borrado: false)
	Tag.find_or_create_by(nombre: "Diseño", borrado: false)
	Tag.find_or_create_by(nombre: "Circuitos", borrado: false)
	Tag.find_or_create_by(nombre: "Electronica", borrado: false)

	Permiso.find_or_create_by(crearpost: 1,comentar: 20, votarpostivo: 15, votarnegativo: 100, etiqueta:300, facultad:500, admin:1000)