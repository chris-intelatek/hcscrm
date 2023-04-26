class AddLeadTypetoProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :intelatek_lead_type, :string
  end
end