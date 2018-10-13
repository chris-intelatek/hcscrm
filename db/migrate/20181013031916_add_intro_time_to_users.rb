class AddIntroTimeToUsers < ActiveRecord::Migration
  def change
    add_column :prospects, :intelatek_time, :string
  end
end