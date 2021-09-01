class Badge < ApplicationRecord
  has_many :own_badges, inverse_of: :badge, dependent: :destroy

  validates :title, presence: true
  validates :condition, presence: true

  BADGE_TYPES = %w[all_level_tests_passed all_tests_in_category_passed first_try_passed].freeze
end