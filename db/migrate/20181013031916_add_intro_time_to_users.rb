class AddIntroTimeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :intelatek_time, :string
  end
end