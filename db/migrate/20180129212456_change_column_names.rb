class ChangeColumnNames < ActiveRecord::Migration
  def change
    rename_column :users, :first_name,  :advisor_first_name
    rename_column :users, :last_name,   :advisor_last_name

    add_column    :users, :advisor_phone,   :string
    add_column    :users, :advisor_mobile,  :string
  end
end
