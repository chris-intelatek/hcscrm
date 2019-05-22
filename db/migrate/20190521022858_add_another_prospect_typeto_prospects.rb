class AddAnotherProspectTypetoProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :vcp_prospect, :boolean, default: false
  end
end
