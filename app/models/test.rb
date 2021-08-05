class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :category

  has_many :questions
  has_many :results
  has_many :users, through: :results, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :middle, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  scope :titles_by_category, lambda { |category|
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  }
end
