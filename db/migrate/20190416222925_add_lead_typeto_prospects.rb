class AddLeadTypetoProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :intelatek_lead_type, :string
  end
end