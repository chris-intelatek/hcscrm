class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :mailing_address, :string
    add_column :users, :apt_suite, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
  end
end
