class AddMoreColumnsToProspect < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :sm_received_date, :date
    add_column :prospects, :sm_status, :string
  end
end
