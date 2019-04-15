class GhostSerializer < ActiveModel::Serializer
  attributes :id, :username, :age, :image, :roles, :motto, :credits
  has_many :haunts
  has_many :houses, through: :haunts
  has_many :searches
  has_many :properties
end
