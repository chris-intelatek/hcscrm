class AddSignupDateToUser < ActiveRecord::Migration
  def change
    add_column :users, :signup_date, :date
    add_column :users, :fee, :integer
  end
end
