class AddVirtualCardsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :vcp_content, :text
  end
end