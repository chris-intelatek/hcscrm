class AddDatesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :training_date, :date
    add_column :users, :business_plan_date, :date
  end
end