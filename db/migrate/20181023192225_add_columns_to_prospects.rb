class AddColumnsToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :next_action, :string
    add_column :prospects, :next_action_date, :date
  end
end
