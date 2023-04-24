class AddPayColumnsToProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :hcs_prospect, :boolean, default: false
    add_column :prospects, :pay_prospect, :boolean, default: false
    add_column :prospects, :pay_intro_presentation_date, :date
    add_column :prospects, :pay_intro_presenter, :string
    add_column :prospects, :pay_sme_presentation_date, :date
    add_column :prospects, :pay_sme, :string
    add_column :prospects, :pay_status, :string
    add_column :prospects, :pay_agreement_date, :date
    add_column :prospects, :pay_hourly_employees, :integer, default: 0
    add_column :prospects, :pay_next_action_date, :date
    add_column :prospects, :pay_next_action, :string
  end
end