class AddSubmittedHcsqToProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :submitted_hcsq, :boolean, default: false
  end
end