class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :tests, through: :results, dependent: :destroy

  def test_by_level(level = 0)
    tests.where(level: level)
  end
end
