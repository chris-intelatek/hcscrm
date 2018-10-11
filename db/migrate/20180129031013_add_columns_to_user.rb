class AddColumnsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first, :string
    add_column :users, :last, :string
    add_column :users, :admin, :boolean,            default: false
    add_column :users, :manager, :boolean,          default: false
  end
end
