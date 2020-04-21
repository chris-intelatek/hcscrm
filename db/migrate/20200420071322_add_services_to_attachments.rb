class AddServicesToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :service_type, :string
  end
end
