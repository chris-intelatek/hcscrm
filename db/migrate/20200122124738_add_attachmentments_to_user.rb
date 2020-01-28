class AddAttachmentmentsToUser < ActiveRecord::Migration
  def change
    add_column :users, :advisor_nda, :string
    add_column :users, :advisor_documents, :string
    add_column :users, :frs_agreement, :string    
  end
end