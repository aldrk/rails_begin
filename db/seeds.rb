# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create([{ title: 'Backend' }, { title: 'Frontend' }, { title: 'DevOps' }])
User.create([{ login: 'Alex', password: '1234' }, { login: 'Masha', password: '4321' }])
Test.create([{ title: 'Rails test', level: 2, category_id: 1, author_id: 1 },
             { title: 'React test', level: 1, category_id: 2, author_id: 2 },
             { title: 'Vue test', level: 0, category_id: 2, author_id: 1 }])
Question.create([{ title: 'Is React frontend framework?', test_id: 2 },
                 { title: 'What campaign did create React?', test_id: 2 },
                 { title: 'Is Rails backend framework?', test_id: 1 },
                 { title: 'Is Vue backend framework?', test_id: 3 }])
Answer.create([{ title: 'yes', correct: true, question_id: 1 },
               { title: 'no', correct: false, question_id: 1 },
               { title: 'yes', correct: true, question_id: 3 },
               { title: 'no', correct: false, question_id: 3 },
               { title: 'Facebook', correct: true, question_id: 2 },
               { title: 'Google', correct: false, question_id: 2 },
               { title: 'Netflix', correct: false, question_id: 2 },
               { title: 'Yandex', correct: false, question_id: 2 },
               { title: 'yes', correct: false, question_id: 4 },
               { title: 'no', correct: true, question_id: 4 }])
