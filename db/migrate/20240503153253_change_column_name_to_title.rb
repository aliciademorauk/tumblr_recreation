class ChangeColumnNameToTitle < ActiveRecord::Migration[7.1]
  def change
    rename_column :comments, :name, :title
  end
end
