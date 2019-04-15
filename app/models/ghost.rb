class Ghost < ApplicationRecord
  has_secure_password
  after_create :add_credits
  validates :username, uniqueness: { case_sensitive: false }
  #can use rolify now to use those methods to assign roles at different points of creation/updating
  rolify
  has_many :haunts
  has_many :houses, through: :haunts
  has_many :searches
  has_many :properties, foreign_key: "medium_id", class_name: "House"

  def add_credits
    if self.roles.any? { |role| role.name == "agent" }
      self.update(credits: 10)
    end
  end

  def self.agents
    self.all.select { |ghost|
      ghost.roles.any? { |role| role.name=="agent" }
    }
  end
end
