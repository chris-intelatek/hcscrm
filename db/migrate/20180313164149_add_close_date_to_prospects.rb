class AddCloseDateToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :close_date, :date
    add_column :prospects, :references_given, :boolean, default: false
  end
end