class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :variants, array: true
      t.integer :correct
      t.integer :question_id

      t.timestamps
    end
  end
end
