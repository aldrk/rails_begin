# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'DevOps' }, { title: 'Backend' }, { title: 'Frontend' }])

users = User.create!([{ login: 'Alex', password: '1234' }, { login: 'Masha', password: '4321' }])

react_test = Test.create!({ title: 'Rails test', level: 2, category: categories[1], author: users[0] })
rails_test = Test.create!({ title: 'React test', level: 1, category: categories[2], author: users[1] })
vue_test = Test.create!({ title: 'Vue test', level: 0, category: categories[2], author: users[0] })

react_q1 = Question.create!({ title: 'Is React frontend framework?', test: react_test })
react_q2 = Question.create!({ title: 'What campaign did create React?', test: react_test })
rails_q1 = Question.create!({ title: 'Is Rails backend framework?', test: rails_test })
vue_q1 = Question.create!({ title: 'Is Vue backend framework?', test: vue_test })

Answer.create!([{ title: 'yes', correct: true, question: react_q1 },
                { title: 'no', correct: false, question: react_q1 },
                { title: 'yes', correct: true, question: rails_q1 },
                { title: 'no', correct: false, question: rails_q1 },
                { title: 'Facebook', correct: true, question: react_q2 },
                { title: 'Google', correct: false, question: react_q2 },
                { title: 'Netflix', correct: false, question: react_q2 },
                { title: 'Yandex', correct: false, question: react_q2 },
                { title: 'yes', correct: false, question: vue_q1 },
                { title: 'no', correct: true, question: vue_q1 }])

Result.create!([{ user: users[0], test: react_test }, { user: users[0], test: rails_test }])
