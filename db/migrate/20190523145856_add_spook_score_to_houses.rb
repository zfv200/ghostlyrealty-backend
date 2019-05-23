class AddSpookScoreToHouses < ActiveRecord::Migration[5.2]
  def change
    add_column :houses, :spook_score, :float
  end
end
