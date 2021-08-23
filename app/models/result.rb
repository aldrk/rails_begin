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
    self.test_correct_answers += 1 if correct_answer?(answer_ids)

    save!
  end

  def success_result?
    correct_answers_percent.to_i >= SUCCESS_COMPLETE
  end

  def correct_answers_percent
    test_correct_answers.to_f / test.questions.count * 100
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answers_ids)
    test_correct_answers_check.ids.sort == answers_ids.map(&:to_i).sort
  end

  def test_correct_answers_check
    current_question.answers.correct
  end

  def next_question
    self.current_question = test.questions.order(:id).find_by('id > ?', current_question.id)
  end
end
