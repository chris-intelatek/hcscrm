class ChangeStatusToHcsOpportunityStatus < ActiveRecord::Migration[7.0]
  def change
    rename_column :prospects, :status, :hcs_opportunity_status
  end
end
