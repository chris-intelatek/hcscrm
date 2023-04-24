class Add < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :attachment1, :string
  end
end
