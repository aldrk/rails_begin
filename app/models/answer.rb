class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }
end
