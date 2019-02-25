class AddMottoToGhosts < ActiveRecord::Migration[5.2]
  def change
    add_column :ghosts, :motto, :string
    add_column :ghosts, :featured, :boolean
  end
end
