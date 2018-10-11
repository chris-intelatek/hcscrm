class AddColumnsToProspect < ActiveRecord::Migration
  def change
    add_column :prospects, :intro_presentation_date, :date
    add_column :prospects, :estimated_ap, :decimal,        default: 0,  null: false
    add_column :prospects, :sm_presentation_date, :date
    add_column :prospects, :actual_ap, :decimal,        default: 0,  null: false
    add_column :prospects, :sm_conversion_est, :decimal,        default: 0,  null: false
    add_column :prospects, :conversion_percentage, :decimal,        default: 0,  null: false
    add_column :prospects, :status, :string
    add_column :prospects, :agreement_date, :date
  end
end
