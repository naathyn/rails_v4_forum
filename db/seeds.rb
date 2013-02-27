# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "CREATING A USER, CATEGORIES, AND BOARDS"

  user = User.create!(email: "username@example.com", username: "username",
  password: "secret", password_confirmation: "secret")
  user.toggle!(:admin)

  first_look = Category.create!(name: "First Look")
  general = Category.create!(name: "General")

  first_look.boards.create!(name: "Announcements",
  description: "Find all the site's news and announcements here.")
  first_look.boards.create!(name: "Introductions",
  description: "Let's get to know each other!")

  general.boards.create!(name: "Off The Wall",
  description: "Talk about anything you'd like.")

puts "COMPLETE"
