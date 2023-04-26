class AddShippingToProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :shipping_prospect, :boolean
    add_column :prospects, :annual_revenue, :integer
    add_column :prospects, :shipping_contact_first_name, :string
    add_column :prospects, :shipping_contact_last_name, :string
    add_column :prospects, :shipping_contact_title, :string
    add_column :prospects, :shipping_contact_direct_phone, :string
    add_column :prospects, :shipping_contact_mobile, :string
    add_column :prospects, :shipping_contact_email, :string
    add_column :prospects, :shipping_type, :string
    add_column :prospects, :shipping_annual_parcel_spend, :integer
    add_column :prospects, :shipping_total_spend, :integer
    add_column :prospects, :shipping_carrier_provided_system, :string
    add_column :prospects, :shipping_interest_in_rate_analysis, :string
    add_column :prospects, :shipping_parcels_per_day, :integer
    add_column :prospects, :shipping_integration, :string
    add_column :prospects, :shipping_notes, :text
    add_column :prospects, :shipping_opportunity_status, :string
    add_column :prospects, :shipping_lead_status, :string
  end
end