class FixEmployeeDefaultValue < ActiveRecord::Migration
  def change
    change_column :prospects, :employees, :integer, default: 0
  end
end
