class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :first, :first_name
    rename_column :users, :last, :last_name
  end
end
