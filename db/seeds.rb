# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "CREATING USERS"

  user1 = User.create!(
    email: "username@example.com",
    username: "username",
    password: "secret",
    password_confirmation: "secret"
  )
  user1.toggle!(:admin)

  user2 = User.create!(
    email: "username_two@example.com",
    username: "username_two",
    password: "secret",
    password_confirmation: "secret"
  )

puts "CREATING CATEGORIES"

  first_look = Category.create!(
    name: "First Look"
  )

  general = Category.create!(
    name: "General"
  )

puts "CREATING BOARDS"

  board1 = first_look.boards.create!(
    name: "Announcements",
    description: "Find all the site's news and announcements here."
  )

  board2 = first_look.boards.create!(
    name: "Introductions",
    description: "Let's get to know each other!"
  )

  general.boards.create!(
    name: "Off The Wall",
    description: "Talk about anything you'd like."
  )

puts "CREATING TOPICS"

  user1.topics.create!(
    board_id: board1.id,
    title: "Welcome",
    content: "Welcome to the forums!"
  )

  topic = user1.topics.create!(
    board_id: board2.id,
    title: "New Here",
    content: "Look forward to meeting you all."
  )

puts "CREATING COMMENTS"

  user2.comments.create!(
    topic_id: topic.id,
    content: "Welcome!"
  )

puts "COMPLETE"
