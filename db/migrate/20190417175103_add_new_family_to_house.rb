class AddNewFamilyToHouse < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :new_family, :boolean
  end
end
