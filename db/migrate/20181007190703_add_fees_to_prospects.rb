class AddFeesToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :hcs_monthly_savings_fee, :decimal, default: 0.0, null: false
    add_column :prospects, :hcs_pepm_fee, :decimal, default: 0.0, null: false
  end
end