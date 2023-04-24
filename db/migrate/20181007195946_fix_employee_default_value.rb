class FixEmployeeDefaultValue < ActiveRecord::Migration[7.0]
  def change
    change_column :prospects, :employees, :integer, default: 0
  end
end
