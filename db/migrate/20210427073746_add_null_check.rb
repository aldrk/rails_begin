class AddNullCheck < ActiveRecord::Migration[6.1]
  def change
    change_column_null(:answers, :variants, false)
    change_column_null(:answers, :correct, false)
    change_column_null(:answers, :question_id, false)
    change_column_null(:categories, :title, false)
    change_column_null(:questions, :title, false)
    change_column_null(:tests, :title, false)
    change_column_null(:tests, :level, false)
    change_column_null(:tests, :category_id, false)
    change_column_null(:tests, :questions, false)
    change_column_null(:users, :login, false)
    change_column_null(:users, :password, false)
  end
end
