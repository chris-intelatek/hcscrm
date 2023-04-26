class FixAnotherColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :prospects,  :effective_date, :agreement_date
  end
end