class ChangeColumnProspect < ActiveRecord::Migration
  def change
    rename_column :prospects,  :sm_presentation_date,	:hcs_sme_first_presentation_date
    rename_column :prospects,  :actual_ap,	            :current_health_benefit_cost
    rename_column :prospects,  :sm_conversion_est,	    :new_estimated_health_benefit_cost
    rename_column :prospects,  :conversion_percentage,	:savings_percentage
    rename_column :prospects,  :agreement_date,	      :effective_date
    rename_column :prospects,  :sm_presenter,		      :hcs_sme
  end
end