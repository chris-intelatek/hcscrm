class AddHomePhoneToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :advisor_home_phone, :string
  end
end