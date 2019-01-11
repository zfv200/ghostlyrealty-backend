class RolifyCreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table(:roles) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:ghosts_roles, :id => false) do |t|
      t.references :ghost
      t.references :role
    end
    
    add_index(:roles, [ :name, :resource_type, :resource_id ])
    add_index(:ghosts_roles, [ :ghost_id, :role_id ])
  end
end
