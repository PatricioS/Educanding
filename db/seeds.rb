# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
	Facultad.find_or_create_by(nombre: "Ingenieria")
	Facultad.find_or_create_by(nombre: "Veterinaria")
	Facultad.find_or_create_by(nombre: "Ciencias Economicas")
	Facultad.find_or_create_by(nombre: "Informatica")
	Facultad.find_or_create_by(nombre: "Medicina")	

	Tag.create(nombre: "Fisica")
	Tag.create(nombre: "Matematica")
	Tag.create(nombre: "Quimica")
	Tag.create(nombre: "Programacion")
	Tag.create(nombre: "Software")
	Tag.create(nombre: "Estadistica")
	Tag.create(nombre: "Arquitectura")
	Tag.create(nombre: "Diseño")
	Tag.create(nombre: "Circuitos")
	Tag.create(nombre: "Electronica")
