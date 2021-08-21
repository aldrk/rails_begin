# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([{ login: 'Alex', password_digest: '1234' }, { login: 'Masha', password_digest: '4321' }])

categories = Category.create!([{ title: 'Backend' }, { title: 'Frontend' }])

react_test = Test.create!({ title: 'Rails test', level: 2, category: categories[0], author: User.first })
rails_test = Test.create!({ title: 'React test', level: 1, category: categories[1], author: User.first })

react_q1 = Question.create!({ title: 'Is React frontend framework?', test: react_test })
react_q2 = Question.create!({ title: 'What campaign did create React?', test: react_test })
rails_q1 = Question.create!({ title: 'Is Rails backend framework?', test: rails_test })

Answer.create!([{ title: 'yes', correct: true, question: react_q1 },
                { title: 'no', correct: false, question: react_q1 },
                { title: 'yes', correct: true, question: rails_q1 },
                { title: 'no', correct: false, question: rails_q1 },
                { title: 'Facebook', correct: true, question: react_q2 },
                { title: 'Google', correct: false, question: react_q2 },
                { title: 'Netflix', correct: false, question: react_q2 },
                { title: 'Yandex', correct: false, question: react_q2 }])

