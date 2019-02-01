class AddPasswordDigestToGhosts < ActiveRecord::Migration[5.2]
  def change
    add_column :ghosts, :password_digest, :string
  end
end
