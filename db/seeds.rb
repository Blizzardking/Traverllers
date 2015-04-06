# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(firstname:  "Renkai",
             lastname: "Ji",
             email: "example@railstutorial.org",
             password:              "12345678",
             password_confirmation: "12345678",
             gender: "1",
             date_of_birth:"1988-10-01",
             safe_question: "Which city did you meet your spouse?",
             safe_answer: "Tianjin",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)


99.times do |n|
  firstname  = Faker::Name.first_name
  lastname  = Faker::Name.last_name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(firstname:  firstname,
               lastname: lastname,
               email: email,
               password:              password,
               password_confirmation: password,
               gender: "1",
               date_of_birth:"1988-10-01",
               safe_question: "Which city did you meet your spouse?",
               safe_answer: "Tianjin",
               activated: true,
             activated_at: Time.zone.now)
end