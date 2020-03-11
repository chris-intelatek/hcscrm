class ChangeSignupToBeStringInUsers < ActiveRecord::Migration
  def change
    change_column :users, :signup_date, :string
  end
end
