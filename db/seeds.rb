# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

PaymentRecurrence.destroy_all
Plan.destroy_all

payment_recurrence = PaymentRecurrence.create(
  name: 'monthly',
  days_delta: 0,
  months_delta: 1,
  years_delta: 0,
  acronym: 'mo'
)

Plan.create(
  name: 'Arcade',
  price: 9.00,
  note: nil,
  status: 'active',
  payment_recurrence:
)

Plan.create(
  name: 'Advanced',
  price: 12.00,
  note: nil,
  status: 'active',
  payment_recurrence:
)

Plan.create(
  name: 'Pro',
  price: 15.00,
  note: nil,
  status: 'active',
  payment_recurrence:
)

payment_recurrence = PaymentRecurrence.create(
  name: 'yearly',
  days_delta: 0,
  months_delta: 0,
  years_delta: 1,
  acronym: 'yr'
)

Plan.create(
  name: 'Arcade',
  price: 90.00,
  note: '2 months free',
  status: 'active',
  payment_recurrence:
)

Plan.create(
  name: 'Advanced',
  price: 120.00,
  note: '2 months free',
  status: 'active',
  payment_recurrence:
)

Plan.create(
  name: 'Pro',
  price: 150.00,
  note: '2 months free',
  status: 'active',
  payment_recurrence:
)
