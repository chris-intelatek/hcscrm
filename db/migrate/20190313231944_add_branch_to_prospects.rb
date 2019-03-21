class AddBranchToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :pay_submitted_to_branch, :boolean, default: false
  end
end
