class AddSignupDateToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :signup_date, :date
    add_column :users, :fee, :integer
  end
end
