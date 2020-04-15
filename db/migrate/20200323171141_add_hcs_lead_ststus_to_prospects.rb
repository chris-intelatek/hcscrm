class AddHcsLeadStstusToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :hcs_lead_status, :string    
  end
end
