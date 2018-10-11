class AddMoreColumnsToProspect < ActiveRecord::Migration
  def change
    add_column :prospects, :sm_received_date, :date
    add_column :prospects, :sm_status, :string
  end
end
