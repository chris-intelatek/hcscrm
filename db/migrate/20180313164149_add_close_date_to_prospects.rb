class AddCloseDateToProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :close_date, :date
    add_column :prospects, :references_given, :boolean, default: false
  end
end