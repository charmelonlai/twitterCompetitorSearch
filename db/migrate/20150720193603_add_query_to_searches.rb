class AddQueryToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :query, :string
  end
end
