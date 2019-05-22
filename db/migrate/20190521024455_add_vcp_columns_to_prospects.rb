class AddVcpColumnsToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :vcp_intro_presentation_date, :date
    add_column :prospects, :vcp_intro_presenter, :string
    add_column :prospects, :vcp_sme_presentation_date, :date
    add_column :prospects, :vcp_supplier_match_meeting_date, :date
    add_column :prospects, :vcp_sme, :string
    add_column :prospects, :vcp_status, :string
    add_column :prospects, :vcp_agreement_date, :date
    add_column :prospects, :vcp_next_action_date, :date
    add_column :prospects, :vcp_next_action, :string
  end
end