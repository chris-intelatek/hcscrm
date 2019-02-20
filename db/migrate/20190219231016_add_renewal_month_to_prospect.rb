class AddRenewalMonthToProspect < ActiveRecord::Migration
  def change
    add_column :prospects, :renewal_month, :string
  end
end
