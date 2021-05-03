# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!({ title: 'DevOps' })
backend_category = Category.create!({ title: 'Backend' })
frontend_category = Category.create!({ title: 'Frontend' })

alex_user = User.create!({ login: 'Alex', password: '1234' })
masha_user = User.create!({ login: 'Masha', password: '4321' })

react_test = Test.create!({ title: 'Rails test', level: 2, category_id: backend_category.id, author_id: alex_user.id })
rails_test = Test.create!({ title: 'React test', level: 1, category_id: frontend_category.id, author_id: masha_user.id })
vue_test = Test.create!({ title: 'Vue test', level: 0, category_id: frontend_category.id, author_id: alex_user.id })

react_q1 = Question.create!({ title: 'Is React frontend framework?', test_id: react_test.id })
react_q2 = Question.create!({ title: 'What campaign did create React?', test_id: react_test.id })
rails_q1 = Question.create!({ title: 'Is Rails backend framework?', test_id: rails_test.id })
vue_q1 = Question.create!({ title: 'Is Vue backend framework?', test_id: vue_test.id })

Answer.create!([{ title: 'yes', correct: true, question_id: react_q1.id },
                { title: 'no', correct: false, question_id: react_q1.id },
                { title: 'yes', correct: true, question_id: rails_q1.id },
                { title: 'no', correct: false, question_id: rails_q1.id },
                { title: 'Facebook', correct: true, question_id: react_q2.id },
                { title: 'Google', correct: false, question_id: react_q2.id },
                { title: 'Netflix', correct: false, question_id: react_q2.id },
                { title: 'Yandex', correct: false, question_id: react_q2.id },
                { title: 'yes', correct: false, question_id: vue_q1.id },
                { title: 'no', correct: true, question_id: vue_q1.id }])

Result.create!([{ user_id: alex_user.id, test_id: react_test.id }, { user_id: alex_user.id, test_id: rails_test.id }])
