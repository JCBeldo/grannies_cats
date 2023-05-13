# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Cat.destroy_all
Granny.destroy_all

  @granny_1 = Granny.create!(name: "Gretta", has_treats: true, age: 77)
  @granny_2 = Granny.create!(name: "Ethel", has_treats: true, age: 88)
  @granny_3 = Granny.create!(name: "Blanche", has_treats: false, age: 66)
  @cat_1 = @granny_1.cats.create!(name: "Snuffles", spayed_neutered: true, lives: 9)
  @cat_2 = @granny_1.cats.create!(name: "Poopykins", spayed_neutered: true, lives: 9)
  @cat_3 = @granny_1.cats.create!(name: "Sillyfluff", spayed_neutered: true, lives: 7)
  @cat_4 = @granny_2.cats.create!(name: "Mr. Wiskers", spayed_neutered: false, lives: 6)
  @cat_5 = @granny_3.cats.create!(name: "DingPu", spayed_neutered: true, lives: 9)
