class AddSwatToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bc_swat, :boolean, default: false
  end
end