class Result < ApplicationRecord
  belongs_to :user, inverse_of: :results
  belongs_to :test, inverse_of: :results
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :next_question

  SUCCESS_COMPLETE = 85

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    puts "!!!!!!!!!!!!!!ACCEPT!!!!!!!!!!!!"
    puts answer_ids
    self.correct_answers += 1 if correct_answer?(answer_ids)

    save!
  end

  def success_result?
    correct_answers_percent.to_i >= SUCCESS_COMPLETE
  end

  def correct_answers_percent
    (self.correct_answers.to_f / self.test.questions.each { |q| q.answers.correct }.count * 100).to_i
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answers_ids)
    correct_answers_count = test_correct_answers.count

    (correct_answers_count == test_correct_answers.where(id: answers_ids).count) &&
      correct_answers_count == answers_ids.count
  end

  def test_correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_question = test.questions.order(:id).find_by('id > ?', current_question.id)
  end
end
