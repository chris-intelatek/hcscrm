class ChangeStatusToHcsOpportunityStatus < ActiveRecord::Migration
  def change
    rename_column :prospects, :status, :hcs_opportunity_status
  end
end
