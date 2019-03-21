class AddPayColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :pay_content, :text
  end
end
