class AddShippingToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :shipping_content, :text
  end
end
