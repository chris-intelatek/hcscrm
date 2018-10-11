class AddContactColumnsToProspect < ActiveRecord::Migration
  def change
    add_column :prospects, :contact1_first_name, :string
    add_column :prospects, :contact1_last_name, :string
    add_column :prospects, :contact1_title, :string
    add_column :prospects, :contact1_phone, :string
    add_column :prospects, :contact1_mobile, :string
    add_column :prospects, :contact1_email, :string
    add_column :prospects, :contact2_first_name, :string
    add_column :prospects, :contact2_last_name, :string
    add_column :prospects, :contact2_title, :string
    add_column :prospects, :contact2_phone, :string
    add_column :prospects, :contact2_mobile, :string
    add_column :prospects, :contact2_email, :string
    add_column :prospects, :primary_contact, :integer
  end
end