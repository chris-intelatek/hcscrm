class ChangeUserAttachmentColumnNames < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :advisor_nda, :attachment2
    rename_column :users, :advisor_documents, :attachment3
    rename_column :users, :frs_agreement, :attachment4
  end
end