class AddBurialGroundToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :burial_ground, :boolean
  end
end
