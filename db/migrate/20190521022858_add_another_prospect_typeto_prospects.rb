class AddAnotherProspectTypetoProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :vcp_prospect, :boolean, default: false
  end
end
