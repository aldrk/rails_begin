class Test < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :category

  has_many :questions
  has_many :results
  has_many :users, through: :results, dependent: :destroy

  def self.titles_by_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
