class AddResultPercentToResult < ActiveRecord::Migration[6.1]
  def change
    add_column :results, :result_percent, :integer, default: 0
  end
end
