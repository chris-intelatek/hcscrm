class RemoveColumnFromProspect < ActiveRecord::Migration
  def change
    remove_column :prospects, :accounts_payable, :decimal
  end
end
