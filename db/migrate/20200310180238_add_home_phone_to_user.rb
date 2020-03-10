class AddHomePhoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :advisor_home_phone, :string
  end
end