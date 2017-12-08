# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	Facultad.find_or_create_by(nombre: "")
	Facultad.find_or_create_by(nombre: "Ingenieria")
	Facultad.find_or_create_by(nombre: "Veterinaria")
	Facultad.find_or_create_by(nombre: "Ciencias Economicas")
	Facultad.find_or_create_by(nombre: "Informatica")
	Facultad.find_or_create_by(nombre: "Medicina")	

	Tag.find_or_create_by(nombre: "Fisica")
	Tag.find_or_create_by(nombre: "Matematica")
	Tag.find_or_create_by(nombre: "Quimica")
	Tag.find_or_create_by(nombre: "Programacion")
	Tag.find_or_create_by(nombre: "Software")
	Tag.find_or_create_by(nombre: "Estadistica")
	Tag.find_or_create_by(nombre: "Arquitectura")
	Tag.find_or_create_by(nombre: "Diseño")
	Tag.find_or_create_by(nombre: "Circuitos")
	Tag.find_or_create_by(nombre: "Electronica")

	Permiso.find_or_create_by(crearpost: 1,comentar: 20, votarpostivo: 15, votarnegativo: 100, etiqueta:300, facultad:500, admin:1000)
