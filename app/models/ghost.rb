class Ghost < ApplicationRecord
  #can use rolify now to use those methods to assign roles at different points of creation/updating
  rolify
  has_many :haunts
  has_many :houses, through: :haunts

  def self.agents
    self.all.select { |ghost|
      ghost.roles.any? { |role| role.name=="agent" }
    }
  end
end