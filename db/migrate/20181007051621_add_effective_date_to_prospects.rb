class AddEffectiveDateToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :effective_date, :date
    add_column :prospects, :hcbq_business_type, :string
    add_column :prospects, :hcbq_no_of_eligible_employees, :integer
    add_column :prospects, :hcbq_total_participation, :integer    
    add_column :prospects, :hcbq_current_carrier, :string
    add_column :prospects, :hcbq_current_coverage_type, :string
    add_column :prospects, :hcbq_most_important, :text
    add_column :prospects, :hcbq_sustainable, :string
    add_column :prospects, :hcbq_oop, :string
    add_column :prospects, :hcbq_like_best, :text
    add_column :prospects, :hcbq_like_least, :text
    add_column :prospects, :hcbq_scale, :integer
    add_column :prospects, :hcbq_perfect_plan, :text
    add_column :prospects, :hcbq_notes, :text
    add_column :prospects, :intelatek_bda, :string
    add_column :prospects, :intelatek_notes, :text
    add_column :prospects, :intelatek_day, :string
    add_column :prospects, :intelatek_timezone, :string
  end
end