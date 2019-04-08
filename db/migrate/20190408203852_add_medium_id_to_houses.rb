class AddMediumIdToHouses < ActiveRecord::Migration[5.2]
  def change
    add_reference :houses, :medium, foreign_key: {to_table: :ghosts} 
  end
end
