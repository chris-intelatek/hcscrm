class AddVirtualCardsToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :vcp_content, :text
  end
end