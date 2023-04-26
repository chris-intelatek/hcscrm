class AddShippingCarriersToProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :shipping_parcel_carrier, :string
    add_column :prospects, :shipping_ltl_per_week, :integer
    add_column :prospects, :shipping_tl_per_week, :integer
    add_column :prospects, :shipping_annual_tl_spend, :integer    
  end
end