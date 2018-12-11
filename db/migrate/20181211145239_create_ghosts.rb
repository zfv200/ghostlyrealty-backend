class CreateGhosts < ActiveRecord::Migration[5.2]
  def change
    create_table :ghosts do |t|
      t.string :username
      t.integer :age
      t.timestamps
    end
  end
end
