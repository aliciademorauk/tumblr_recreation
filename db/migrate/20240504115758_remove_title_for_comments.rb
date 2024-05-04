class RemoveTitleForComments < ActiveRecord::Migration[7.1]
  def change
    remove_column :comments, :title
  end
end
