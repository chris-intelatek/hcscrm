class AddOrganizationtoUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :advisor_company_name, :string
  end
end
