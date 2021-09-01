class AddPassingTimeToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :time_to_pass, :integer, default: 5
  end
end
