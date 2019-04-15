class AddCreditsToAgents < ActiveRecord::Migration[5.2]
  def change
    add_column :ghosts, :credits, :integer
  end
end
