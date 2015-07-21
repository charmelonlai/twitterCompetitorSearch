class AddCompetitorsToUser < ActiveRecord::Migration
  def change
    add_column :users, :competitor, :string
  end
end
