class AddUserIdToProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :user_id, :integer
  end
end
