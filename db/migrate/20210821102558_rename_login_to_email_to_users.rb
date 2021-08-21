class RenameLoginToEmailToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :login, :email
  end
end
