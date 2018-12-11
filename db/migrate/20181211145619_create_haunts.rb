class CreateHaunts < ActiveRecord::Migration[5.2]
  def change
    create_table :haunts do |t|
      t.belongs_to :ghost
      t.belongs_to :house
      t.timestamps
    end
  end
end
