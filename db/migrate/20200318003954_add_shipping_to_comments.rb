class AddShippingToComments < ActiveRecord::Migration
  def change
    add_column :comments, :shipping_content, :text
  end
end
