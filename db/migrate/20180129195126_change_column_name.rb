class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :first, :first_name
    rename_column :users, :last, :last_name
  end
end
