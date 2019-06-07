class AddIntelatekToUsers < ActiveRecord::Migration
  def change
    add_column :users, :intelatek, :boolean, default: false
  end
end
