class FixAnotherColumnName < ActiveRecord::Migration
  def change
    rename_column :prospects,  :effective_date, :agreement_date
  end
end