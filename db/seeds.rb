# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(name: 'admin', email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
50.times { |number| Task.create!(name: "餃子#{number+1}個作る", description: "#{number}個では足らない", user: user)}

Rails.logger.debug 'succeed'
