class AddQueryToUser < ActiveRecord::Migration
  def change
    add_column :users, :query, :string
  end
end
