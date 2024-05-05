class AddContraintsToUsersTable < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :email, :string, null: false 
    change_column :users, :username, :string, null: false
    change_column :users, :password_digest, :string, null: false
  end
end
