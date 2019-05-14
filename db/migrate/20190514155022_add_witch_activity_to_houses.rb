class AddWitchActivityToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :witch_friendly, :boolean
  end
end
