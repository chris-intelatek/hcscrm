class ChangeSignupToBeStringInUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :signup_date, :string
  end
end
