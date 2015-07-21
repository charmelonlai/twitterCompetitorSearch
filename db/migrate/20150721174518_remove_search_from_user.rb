class RemoveSearchFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :search, :string
  end
end
