class AddandChangePayColumnsforBranch < ActiveRecord::Migration
  def change
    rename_column :prospects, :prospect_note, :hcs_notes
    add_column :prospects, :date_submitted_to_branch, :date
    add_column :prospects, :pay_notes, :text
    add_column :prospects, :prospect_notes, :text
  end
end