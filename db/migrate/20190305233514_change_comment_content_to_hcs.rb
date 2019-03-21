class ChangeCommentContentToHcs < ActiveRecord::Migration
  def change
    rename_column :comments, :content, :hcs_content
  end
end
