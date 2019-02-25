class FixImageName < ActiveRecord::Migration[5.2]
  def change
    rename_column :ghosts, :image_url, :image
  end
end
