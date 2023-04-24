class AddRenewalMonthToProspect < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :renewal_month, :string
  end
end
