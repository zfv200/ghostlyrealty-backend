class AddImagesToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :image_url, :string
  end
end
