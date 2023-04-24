class AddPayColumnToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :pay_content, :text
  end
end
