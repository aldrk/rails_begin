class User < ApplicationRecord
  def get_test_by_level(level = 0)
    Test.where(author_id: self).find_by(level: level)
  end
end
