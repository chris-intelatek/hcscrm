class ChangeNextActionColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :prospects, :next_action_date, :hcs_next_action_date
    rename_column :prospects, :next_action, :hcs_next_action
  end
end
