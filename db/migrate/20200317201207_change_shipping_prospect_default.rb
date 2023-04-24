class ChangeShippingProspectDefault < ActiveRecord::Migration[7.0]
  def change
    change_column :prospects, :shipping_prospect, :boolean, default: false
    add_column :users, :shipstore, :boolean, default: false    
  end
end