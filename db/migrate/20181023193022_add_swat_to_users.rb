class AddSwatToUsers < ActiveRecord::Migration
  def change
    add_column :users, :bc_swat, :boolean, default: false
  end
end