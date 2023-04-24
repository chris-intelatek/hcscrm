class AddHcsLeadStstusToProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :hcs_lead_status, :string    
  end
end
