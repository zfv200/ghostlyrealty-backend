class AddImagesToGhosts < ActiveRecord::Migration[5.2]
  def change
    add_column :ghosts, :image_url, :string
  end
end
