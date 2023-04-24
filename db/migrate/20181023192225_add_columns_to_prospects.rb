class AddColumnsToProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :next_action, :string
    add_column :prospects, :next_action_date, :date
  end
end
