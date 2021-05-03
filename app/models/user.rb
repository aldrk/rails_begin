class User < ApplicationRecord
  def test_by_level(level = 0)
    Test
      .joins('JOIN results ON tests.id == results.test_id')
      .where(results: { user_id: self }, tests: { level: level })
  end
end
