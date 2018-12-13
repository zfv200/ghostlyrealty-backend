class AddFeaturedToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :featured, :boolean
  end
end
