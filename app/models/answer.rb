class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_answers_count
    question.errors.add :"can't be more the 4" if question.answers.size >= 4
  end
end
