class AddUserAttachmentColumns < ActiveRecord::Migration
  def change
    add_column :users, :attachment5, :string
    add_column :users, :attachment6, :string
    add_column :users, :attachment7, :string
    add_column :users, :attachment8, :string
    add_column :users, :attachment9, :string
    add_column :users, :attachment10, :string    
    add_column :users, :attachment1_name, :string
    add_column :users, :attachment2_name, :string
    add_column :users, :attachment3_name, :string
    add_column :users, :attachment4_name, :string
    add_column :users, :attachment5_name, :string
    add_column :users, :attachment6_name, :string
    add_column :users, :attachment7_name, :string
    add_column :users, :attachment8_name, :string
    add_column :users, :attachment9_name, :string
    add_column :users, :attachment10_name, :string
  end
end