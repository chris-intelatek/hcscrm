class AddSupportColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :support, :boolean,          default: false
  end
end