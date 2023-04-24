class AddNotesToVcpProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :vcp_notes, :text
  end
end