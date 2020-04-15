class AddShippingNextActionToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :shipping_next_action_date, :date
    add_column :prospects, :shipping_next_action, :string
  end
end