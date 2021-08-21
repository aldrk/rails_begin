require 'digest/sha1'

class User < ApplicationRecord
  include Auth

  has_many :results, inverse_of: :user, dependent: :destroy
  has_many :tests, through: :results
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, inverse_of: :author, dependent: :destroy

  scope :test_by_level, ->(level) { where(level: level) }

  def test_by_level(level = 0)
    tests.where(level: level)
  end

  def test_passage(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
