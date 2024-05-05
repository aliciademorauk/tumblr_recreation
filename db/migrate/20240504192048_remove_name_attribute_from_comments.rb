class RemoveNameAttributeFromComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :name
  end
end
