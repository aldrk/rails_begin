class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id
  has_many :results
  has_many :tests, through: :results

  def test_by_level(level = 0)
    tests.where(level: level)
  end
end
