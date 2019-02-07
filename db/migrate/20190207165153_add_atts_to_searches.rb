class AddAttsToSearches < ActiveRecord::Migration[5.2]
  def change
    add_column :searches, :typedSearch, :boolean
    add_column :searches, :solo_haunt, :boolean
    add_column :searches, :burial_ground, :boolean
    add_column :searches, :complexSearch, :boolean
  end
end
