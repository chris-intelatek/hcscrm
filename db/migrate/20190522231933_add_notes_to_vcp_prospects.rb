class AddNotesToVcpProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :vcp_notes, :text
  end
end