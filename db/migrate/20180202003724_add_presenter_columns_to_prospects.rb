class AddPresenterColumnsToProspects < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :intro_presenter, :string
    add_column :prospects, :sm_presenter, :string
  end
end
