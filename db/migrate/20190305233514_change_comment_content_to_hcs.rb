class ChangeCommentContentToHcs < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :content, :hcs_content
  end
end
