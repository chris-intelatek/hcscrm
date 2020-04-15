class ChangeShippingProspectDefault < ActiveRecord::Migration
  def change
    change_column :prospects, :shipping_prospect, :boolean, default: false
    add_column :users, :shipstore, :boolean, default: false    
  end
end