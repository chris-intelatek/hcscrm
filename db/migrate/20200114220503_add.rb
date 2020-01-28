class Add < ActiveRecord::Migration
  def change
    add_column :users, :attachment1, :string
  end
end
