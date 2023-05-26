# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

PaymentRecurrence.destroy_all
Plan.destroy_all

monthly = PaymentRecurrence.create!(
  name: 'monthly',
  acronym: 'mo',
  days_delta: 0,
  months_delta: 1,
  years_delta: 0
)

yearly = PaymentRecurrence.create!(
  name: 'yearly',
  acronym: 'yo',
  days_delta: 0,
  months_delta: 0,
  years_delta: 1
)

Plan.create(
  name: 'arcade',
  price: 9.00,
  status: 'available',
  note: nil,
  payment_recurrence: monthly,
  icon_url: '/1rXqk06/arcade-plan-icon.png'
)

Plan.create(
  name: 'arcade',
  price: 90.00,
  note: '2 months free',
  status: 'available',
  payment_recurrence: yearly,
  icon_url: '/1rXqk06/arcade-plan-icon.png'
)

Plan.create(
  name: 'advanced',
  price: 12.00,
  status: 'available',
  note: nil,
  payment_recurrence: monthly,
  icon_url: '/MspwF5X/advanced-plan-icon.png'
)

Plan.create(
  name: 'advanced',
  price: 120.00,
  note: '2 months free',
  status: 'available',
  payment_recurrence: yearly,
  icon_url: '/MspwF5X/advanced-plan-icon.png'
)

Plan.create(
  name: 'pro',
  price: 15.00,
  status: 'available',
  note: nil,
  payment_recurrence: monthly,
  icon_url: '/nDGT4xW/pro-plan-icon.png'
)

Plan.create(
  name: 'pro',
  price: 150.00,
  note: '2 months free',
  status: 'available',
  payment_recurrence: yearly,
  icon_url: '/nDGT4xW/pro-plan-icon.png'
)
