class AddMediumToGhosts < ActiveRecord::Migration[5.2]
  def change
    add_column :ghosts, :medium, :string
  end
end
