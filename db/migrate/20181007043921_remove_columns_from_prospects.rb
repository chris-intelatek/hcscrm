class RemoveColumnsFromProspects < ActiveRecord::Migration[7.0]
  def change
    remove_column :prospects, :revenue
    remove_column :prospects, :vc_already
    remove_column :prospects, :estimated_ap
    remove_column :prospects, :sm_status
    remove_column :prospects, :references_given
  end
end