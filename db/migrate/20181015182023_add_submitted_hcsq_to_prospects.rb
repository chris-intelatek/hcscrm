class AddSubmittedHcsqToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :submitted_hcsq, :boolean, default: false
  end
end