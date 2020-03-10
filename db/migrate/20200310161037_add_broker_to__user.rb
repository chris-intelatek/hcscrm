class AddBrokerToUser < ActiveRecord::Migration
  def change
    add_column :users, :broker, :string
    add_column :users, :fee_payment_method, :string
  end
end