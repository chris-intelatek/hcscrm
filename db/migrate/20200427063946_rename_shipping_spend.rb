class RenameShippingSpend < ActiveRecord::Migration[7.0]
  def change
    rename_column :prospects, :shipping_total_spend, :shipping_annual_ltl_spend
  end
end
