class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.belongs_to :ghost
      t.string :description
    end
  end
end
