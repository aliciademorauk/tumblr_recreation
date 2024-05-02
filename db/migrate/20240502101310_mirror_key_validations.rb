class MirrorKeyValidations < ActiveRecord::Migration[7.1]
  def change
    change_column :posts, :title, :string, null: false 
    change_column :posts, :body, :text, null: false
  end
end
