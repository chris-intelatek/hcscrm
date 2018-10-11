class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :organization
      t.string :street_address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :website
      t.integer :employees
      t.decimal :revenue,                 default: 0,  null: false
      t.decimal :accounts_payable,        default: 0,  null: false
      t.boolean :vc_already,              default: false
      t.text :prospect_note
      t.timestamps null: false
    end
  end
end
