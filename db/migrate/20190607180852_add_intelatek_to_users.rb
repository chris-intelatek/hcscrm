class AddIntelatekToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :intelatek, :boolean, default: false
  end
end
