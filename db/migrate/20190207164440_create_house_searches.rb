class CreateHouseSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :house_searches do |t|
      t.belongs_to :search
      t.belongs_to :house
    end
  end
end
