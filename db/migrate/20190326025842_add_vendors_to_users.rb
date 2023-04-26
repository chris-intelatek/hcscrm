class AddVendorsToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :bc_swat, :boolean
    add_column :users, :entrust, :boolean, default: false
    add_column :users, :branch, :boolean, default: false
  end
end