class Test < ApplicationRecord
  def self.get_test_by_category(category)
    category_id = Category.find_by(title: category).id

    Test.select(:title).where(category_id: category_id).order('title DESC')
  end

end
