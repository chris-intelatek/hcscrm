class AddGravatarToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :gravatar, :string
  end
end