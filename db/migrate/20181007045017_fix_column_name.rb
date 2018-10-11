class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :prospects, :hcs_sme_first_presentation_date, :hcs_sme_fact_finding_call_date
    rename_column :prospects, :sm_received_date, :hcs_sme_proposal_meeting_date
  end
end
