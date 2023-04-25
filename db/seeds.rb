# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Plan.create(
  name: 'Arcade',
  frequence_number: 1,
  frequence_unit: 'mo',
  price: 9.00,
  note: nil
)

Plan.create(
  name: 'Arcade',
  frequence_number: 1,
  frequence_unit: 'yr',
  price: 90.00,
  note: '2 months free',
)

Plan.create(
  name: 'Advanced',
  frequence_number: 1,
  frequence_unit: 'mo',
  price: 12.00,
  note: nil
)

Plan.create(
  name: 'Advanced',
  frequence_number: 1,
  frequence_unit: 'yr',
  price: 120.00,
  note: '2 months free',
)

Plan.create(
  name: 'Pro',
  frequence_number: 1,
  frequence_unit: 'mo',
  price: 15.00,
  note: nil
)

Plan.create(
  name: 'Pro',
  frequence_number: 1,
  frequence_unit: 'yr',
  price: 150.00,
  note: '2 months free',
)
