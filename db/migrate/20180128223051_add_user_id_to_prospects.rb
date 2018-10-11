class AddUserIdToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :user_id, :integer
  end
end
