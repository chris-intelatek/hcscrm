class AddOrganizationtoUsers < ActiveRecord::Migration
  def change
    add_column :users, :advisor_company_name, :string
  end
end
